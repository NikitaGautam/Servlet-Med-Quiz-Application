package controller;

import domains.QuestionAnswer;
import service.QuestionAnswerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

/**
 * Created by Nikita on 11/16/16.
 */
@WebServlet(name = "QuizServlet")
public class QuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String action = request.getParameter("action");
        if(action.equalsIgnoreCase("play")){
            List<QuestionAnswer> randomQuestions = new ArrayList<>();
            List<String> selectedAns = new ArrayList<>();

            int score = 0;
            int index = 0;
            if (request.getParameter("score") != null){
               score = Integer.parseInt(request.getParameter("score"));
            }
            if (request.getParameter("index") != null){
                index = Integer.parseInt(request.getParameter("index"));
            }

            if (request.getParameter("selectedAns") != null){
                selectedAns = (List<String>) session.getAttribute("selectedAns");
            }
            if(request.getParameter("randomQuestions") != null){
                randomQuestions = (List<QuestionAnswer>) session.getAttribute("randomQuestions");
            }

            if(randomQuestions.isEmpty()){
                 randomQuestions = new QuestionAnswerService().getQAList();
                 long seed = System.nanoTime();
                 Collections.shuffle(randomQuestions, new Random(seed));
                 session.setAttribute("randomQuestions",randomQuestions);
                 request.setAttribute("score",0);
                 request.setAttribute("index",0);
                 session.setAttribute("selectedAns",selectedAns);
                 RequestDispatcher rd = request.getRequestDispatcher("quiz/playQuiz.jsp");
                 rd.forward(request, response);

            }
            else {
                String correctValue = randomQuestions.get(Integer.parseInt(request.getParameter("index"))).getCorrect_ans();
                if(request.getParameter("options").equalsIgnoreCase(correctValue)){
                    System.out.println("correct");
                    score += 1;
                }

                selectedAns.add(request.getParameter("options"));
                System.out.println(selectedAns);
                request.setAttribute("score", score);
                request.setAttribute("index", index+1);
                request.setAttribute("randomQuestions", randomQuestions);
                request.setAttribute("selectedAns",selectedAns);

                if(index == randomQuestions.size() -1){

                    RequestDispatcher rd = request.getRequestDispatcher("quiz/scorePage.jsp");
                    rd.forward(request, response);
                }
                else {
                    RequestDispatcher rd = request.getRequestDispatcher("quiz/playQuiz.jsp");
                    rd.forward(request, response);
                }

            }

//             int score = request.getAttribute("score");

         }
        else if(action.equalsIgnoreCase("home")){
            RequestDispatcher rd = request.getRequestDispatcher("user/homeUser.jsp");
            rd.forward(request, response);

        }
    }

    public void redirectList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<QuestionAnswer> questionAnswerList = new QuestionAnswerService().getQAList();
        if (questionAnswerList !=null){

            RequestDispatcher rd = request.getRequestDispatcher("questionAnswer/qaLists.jsp");
            rd.forward(request, response);
        }
        else {
            RequestDispatcher rd = request.getRequestDispatcher("quiz/userHome.jsp");
            rd.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
