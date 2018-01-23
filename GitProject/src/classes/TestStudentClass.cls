@isTest
public class TestStudentClass {

    @isTest static void createStudent(){
        StudentClass c = new StudentClass();
        c.name = 'Muhammad Usman';
        c.reg = '14545ssd';
        c.roll = 'stud1212';
        c.newRecord();
    }
    @isTest static void createStudentCatch(){
        StudentClass c = new StudentClass();
        c.name = Null;
        c.reg = null;
        c.roll = null;
        c.newRecord();
    }
    @isTest static void deleteStudent(){
        StudentClass c  = new StudentClass();
        student__c stud = new student__c(Name = 'Usman',Registration__c='140ss',Roll_No__c='14040');
        insert stud;
        c.deleteId = stud.Id;
        c.deleteRecord();
    }
    @isTest static void editGetRecord(){
        StudentClass c = new StudentClass();
        Student__c addStud = new Student__c(Name='MuhammadUsman',Registration__c='Reg_140',Roll_No__c='Roll_140');
        insert addStud;
        c.editRecordId = addStud.Id;
        Student__c obj = [Select Name , Registration__c,Roll_No__c From Student__c
                         where id =: c.editRecordId];
        c.name = obj.Name;
        c.reg = obj.Registration__c;
        c.roll = obj.Roll_No__c;
        c.updateRecord();
    }
    @isTest static void editGerRecord1(){
         StudentClass c = new StudentClass();
        Student__c addStud = new Student__c(Name='MuhammadUsman',Registration__c='Reg_140',Roll_No__c='Roll_140');
        insert addStud;
        c.editRecordId = addStud.Id;
        Student__c obj = [Select Name , Registration__c,Roll_No__c From Student__c
                         where id =: c.editRecordId];
        c.name = obj.Name;
        c.reg = obj.Registration__c;
        c.roll = obj.Roll_No__c;
        c.name = 'Muhammd Binyamin';
        c.reg = 'CE140';
        c.roll = 'Roll140';
        c.updateRecord1();
    }
    @isTest static void deleteCourseTest(){
        StudentClass c = new  StudentClass();
        c.courseId = Null;
        c.DeleteCourse();
    }
    @isTest static void showCourseTest(){
        StudentClass c = new StudentClass();
        Student__c stu = new Student__c(Name = 'muh',Registration__c = '140_reg', Roll_No__c='140_roll');
        Course__c cou = new Course__c(Name= 'Phy');
        insert stu;
        insert cou;
        Student_And_Course__c stucou = new Student_And_Course__c(Name = 'Phy',Student__c = stu.Id,Course__c=cou.Id);
        insert stucou;
        c.courseId = stu.Id;
       c.ShowCourse();
    }
    @isTest Static void insertCoursTest(){
        StudentClass c = new StudentClass();
        c.courseName = 'Php';
        Course__c cou = new Course__c(Name=c.courseName);
        Student__c stu = new Student__c(Name='Muhammad Usman',Registration__c='Reg_404',Roll_No__c='Roll_414');
        insert cou;
        insert stu;
        Student_And_Course__c stucou = new Student_And_Course__c(Name='Admin', Student__c=stu.id, course__c=cou.id);
        insert stucou;
        c.InsertCourse();
    }
    @isTest static void OptionsTest(){
        StudentClass c = new StudentClass();
        List<SelectOption> sl = new List<SelectOption>();
        Course__c couList = new Course__c(Name='Physics');
        insert couList;
        sl= c.getOptions();
    }
     @isTest static void coursePageReferenceTest(){
       StudentClass c = new  StudentClass();
       PageReference pF = c.goToCourses();
      // Test.setCurrentPage(pF);
         
            }
    @isTest static void goTomyFirstPageReferenceTest(){
        StudentClass c = new StudentClass();
         PageReference pF = c.goToMyFirstPage();
       // Test.setCurrentPage(pf);
    }
    @isTest static void goToMyRegistrationFormReferenceTest(){
        StudentClass c = new StudentClass();
        PageReference pf = c.createStud();
        //Test.setCurrentPage(pf);
    }    
    
    }