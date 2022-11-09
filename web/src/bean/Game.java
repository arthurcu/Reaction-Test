package bean;

public class Game {
    private String name;
    private int reactiontime;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getReactiontime() {
        return reactiontime;
    }

    public void setReactiontime(int reactiontime) {
        this.reactiontime = reactiontime;
    }

    public String toString(){
        return name+" "+ reactiontime;
    }
}
