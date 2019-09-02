package models;

public class Question {
    public int id;
    public String fullQuestion;
    public String optionOne;
    public String optionTwo;
    public String optionThree;
    public String optionFour;

    public void setId(int id) {
        this.id = id;
    }

    public void setFullQuestion(String fullQuestion){
        this.fullQuestion=fullQuestion;
    }

    public void setOptionOne(String optionOne){
        this.optionOne=optionOne;
    }

    public void setOptionTwo(String optionTwo){
        this.optionTwo=optionTwo;
    }

    public void setOptionThree(String optionThree){
        this.optionThree=optionThree;
    }

    public void setOptionFour(String optionFour){
        this.optionFour=optionFour;
    }

    public int getId() {
        return id;
    }

    public String getFullQuestion() {
        return fullQuestion;
    }

    public String getOptionOne() {
        return optionOne;
    }

    public String getOptionTwo() {
        return optionTwo;
    }

    public String getOptionThree() {
        return optionThree;
    }

    public String getOptionFour() {
        return optionFour;
    }
}
