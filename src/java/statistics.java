  public class statistics {
        public Integer job;
        public Integer user;
        public String place;
        public void setId(Integer id){
            this.job= job;
        }
        public statistics(){
        job=0;
        user=0;
        place="null";
        }

        public String getPlace(){
            return place;
        }
        public int getJob(){
            return job;
        }
        public int getUser(){
            return user;
        }

        public void setPlace(String place){
            this.place = place;
        }
        public void setJob(int job){
            this.job = job;
        }
        public void setUser(int user){
            this.user = user;
        }

    }