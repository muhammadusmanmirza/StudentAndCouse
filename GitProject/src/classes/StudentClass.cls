public class StudentClass {
    public List<Student__c> students {get;set;}
    public List<Course__c> courses {get;set;}
    public List<Student__c> studentId{get;set;}
    public String name {get;set;}
    public String reg {get;set;}
    public String roll {get;set;}
    public String courseName {get;set;}
    public Student__c Obj {get;set;}
    public id deleteId{get; set;}
    public Id editRecordId{get;set;}
    public Id courseId {get;set;}
    public boolean showCourseFlag{get;set;}
  //  public String computerScience{get;set;}
 
          
    public StudentClass(){
        students =new List<Student__c>();
        students = showRecord();
        studentId = new List<Student__C>();
        Obj = new Student__c();
        courses = new List<Course__c>();
        showCourseFlag=false;
        
       // List<Student_And_Course__c> listc = new List<Student_And_Course__c>();
      //  studentId = deleteRecord();
      
    }
    
    public void newRecord(){
        Student__c stuRec = new Student__c (Name = name,Roll_No__c = roll, Registration__c =reg );
        try{
            insert stuRec;
        }
        catch(DmlException e){
            System.debug('The Contact is not Successfully Inserted due To ' + e.getMessage());
        }
    }
    
    public List<Student__c> showRecord(){
        List<Student__c> stud =[select Name , Roll_No__c , Registration__c from Student__c ];
        return stud;   
    }
   
    public void deleteRecord(){
        List<Student__c> delStud = [select Name , Roll_No__c , Registration__c
                                   from Student__c
                                   where Id =:deleteId];
        delete delStud;
        
    }
    
    public void updateRecord(){
          Obj  = [Select Name , Roll_No__c , Registration__c
                                  from Student__c
                                  where id =:editRecordId];
          name = Obj.Name;
          roll = Obj.Roll_No__c;
          reg  = Obj.Registration__c;
        
    }
    
    public void updateRecord1(){
        Obj.Name = name;
        Obj.Registration__c = reg;
        Obj.Roll_No__c = roll;
        update Obj;
    }
    public Void ShowCourse(){
      List<Course__c> couName = new List<Course__c>();
      List<Student_And_Course__c> courName =[Select Course__r.Name from Student_And_Course__c
                                where Student__c =:courseId ];
        for(Student_And_Course__c co : courName){
            Course__c[] cou = [Select Name From Course__c
                 where id =: co.Course__c];
            CouName.Add(cou[0]);
        }
        courses = CouName;
        showCourseFlag=true;
    }
    
    public PageReference createStud(){
        return Page.RegistrtionForm;
    }
    
    public PageReference goToMyFirstPage(){
        return Page.MyFirstPage;
    }
    
    public List<selectOption> getOptions()
    {
        List<selectOption> opLis=new List<selectOption>();
        List<Course__c> couLis=[Select Name From Course__c];
       	opLis.add(new selectoption(' ', ' '));	
        For(Course__c cLis : couLis)
            {
       			  opLis.add(new selectoption(cLis.Name, cLis.Name));
             }
        return oplis;
    }
    
    public void InsertCourse()
    {
        Course__c[] courseObj = [Select Name from Course__c
                              where Name like :courseName ];
        Course__c cour=courseObj[0];
        Student_And_Course__c stdcou=new Student_And_Course__c(Name='Admin', Student__c=courseId, Course__c=cour.Id);
        insert stdcou;
        ShowCourse();
    }
    public void DeleteCourse(){
        List<Course__c> delObj = [Select Name from Course__c
                                 where id =: courseId];
        delete delobj;
    }
    
    public PageReference goToUpdate(){
        updateRecord();
        return Page.RegistrtionForm;
    }
    public PageReference goToCourses(){
        Return Page.CoursesPage;
    }
}