# -*- coding : utf-8 -*-
# coding: utf-8

from flask import *
from flask_bootstrap import Bootstrap
from flask_wtf import FlaskForm
from wtforms import *
import pymysql

app = Flask(__name__)
bootstrap = Bootstrap(app)
app.config['SECRET_KEY'] = 'cbYSt76Vck*7^%4d'

conn = pymysql.connect(
    host="localhost",
    user='root',
    database="lab3",
    charset="utf8")


@app.route('/index')
@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template('index.html')


@app.route('/campus', methods=['GET', 'POST'])
def campus():
    res = []
    if request.method == 'POST':
        print(request.form)
        cursor = conn.cursor()
        op = request.form["query"]
        if op == "insert":
            sql = """
            insert into Campus (Campus_id, Campus_name, Campus_address) values (%s, %s, %s);
            """
            Campus_id = request.form["Campus_id"]
            Campus_name = request.form["Campus_name"]
            Campus_address = request.form["Campus_address"]
            cursor.execute(sql, [Campus_id, Campus_name, Campus_address])
            flash("操作成功")
            sql = "select * from Campus;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "delete":
            sql = """
            delete from Campus where Campus_id=%s;
            """
            Campus_id = request.form["Campus_id"]
            cursor.execute(sql, Campus_id)
            flash("操作成功")
            sql = "select * from Campus;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "select":
            sel = []
            logic = []
            subclause = []
            i = 0
            if "sel0" in request.form:
                sel.append(request.form["sel0"])
            else:
                sel.append("\0")
            while sel[i]:
                subclause.append(request.form["subclause" + str(i)])
                i= i + 1
                if "logic" + str(i) in request.form:
                    logic.append(request.form["logic" + str(i)])
                    sel.append(request.form["sel" + str(i)])
                else:
                    break
            if i == 0:
                sql = "select * from Campus"
            else:
                sql = "select * from Campus where "
                for j in range(0, i):
                    if sel[j] == "ID":
                        sel[j] = "Campus_id"
                    elif sel[j] == "name":
                        sel[j] = "Campus_name"
                    else:
                        sel[j] = "Campus_address"
                    sql = sql + sel[j] + "=\"" + subclause[j] + "\""
                    if not j == i-1:
                        sql = sql + " " + logic[j] + " "
            cursor.execute(sql)
            flash("操作成功")
            res = cursor.fetchall()
        elif op == "update":
            Campus_id = request.form["Campus_id"]
            Campus_name = request.form["Campus_name"]
            Campus_address = request.form["Campus_address"]
            if not Campus_name + Campus_address:
                flash("什么也不做")
            else:
                sql = "update Campus set"
                if Campus_name:
                    sql = sql + " Campus_name=" + "\"" + Campus_name + "\""
                    if Campus_address:
                        sql = sql + ","
                if Campus_address:
                    sql = sql + " Campus_address=" + "\"" + Campus_address + "\""
                sql = sql + " where Campus_id=" + "\"" + Campus_id + "\""
                print(sql)
                cursor.execute(sql)
                flash("操作成功")
            sql = "select * from Campus;"
            cursor.execute(sql)
            res = cursor.fetchall()
        cursor.close()
    else:
        cursor = conn.cursor()
        sql = """
            select * from Campus;
            """
        cursor.execute(sql)
        res = cursor.fetchall()
        cursor.close()
    return render_template('campus.html', campus=res)


@app.route('/major', methods=['GET', 'POST'])
def major():
    res = []
    if request.method == 'POST':
        print(request.form)
        cursor = conn.cursor()
        op = request.form["query"]
        if op == "insert":
            sql = """
                insert into Major (Major_id, Major_name, Major_address, Major_campus_id, Major_leader) 
                values (%s, %s, %s, %s, %s);
                """
            Major_id = request.form["major_id"]
            Major_name = request.form["major_name"]
            Major_address = request.form["major_address"]
            Major_campus_id = request.form["major_campus"]
            Major_leader = request.form["major_leader"]
            cursor.execute(sql, [Major_id, Major_name, Major_address, Major_campus_id, Major_leader])
            flash("操作成功")
            sql = "select * from Major;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "delete":
            sql = """
                delete from Major where Major_id=%s;
                """
            Major_id = request.form["major_id"]
            cursor.execute(sql, Major_id)
            flash("操作成功")
            sql = "select * from Major;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "select":
            sel = []
            logic = []
            subclause = []
            i = 0
            if "sel0" in request.form:
                sel.append(request.form["sel0"])
            else:
                sel.append("\0")
            while sel[i]:
                subclause.append(request.form["subclause" + str(i)])
                i = i + 1
                if "logic" + str(i) in request.form:
                    logic.append(request.form["logic" + str(i)])
                    sel.append(request.form["sel" + str(i)])
                else:
                    break
            if i == 0:
                sql = "select * from Major"
            else:
                sql = "select * from Major where "
                for j in range(0, i):
                    if sel[j] == "ID":
                        sel[j] = "Major_id"
                    elif sel[j] == "name":
                        sel[j] = "Major_name"
                    elif sel[j] == "addr":
                        sel[j] = "Major_address"
                    elif sel[j] == "campus":
                        sel[j] = "Major_campus_id"
                    else:
                        sel[j] = "Major_leader"
                    sql = sql + sel[j] + "=\"" + subclause[j] + "\""
                    if not j == i - 1:
                        sql = sql + " " + logic[j] + " "
            print(sql)
            cursor.execute(sql)
            flash("操作成功")
            res = cursor.fetchall()
        elif op == "update":
            Major_id = request.form["major_id"]
            Major_name = request.form["major_name"]
            Major_address = request.form["major_address"]
            Major_campus_id = request.form["major_campus"]
            Major_leader = request.form["major_leader"]
            if not Major_name + Major_address + Major_campus_id + Major_leader:
                flash("什么也不做")
            else:
                sql = "update Major set"
                if Major_name:
                    sql = sql + " Major_name=" + "\"" + Major_name + "\""
                    if Major_address or Major_campus_id or Major_leader:
                        sql = sql + ","
                if Major_address:
                    sql = sql + " Major_address=" + "\"" + Major_address + "\""
                    if Major_campus_id or Major_leader:
                        sql = sql + ","
                if Major_campus_id:
                    sql = sql + " Major_campus_id=" + "\"" + Major_campus_id + "\""
                    if Major_leader:
                        sql = sql + ","
                if Major_leader:
                    sql = sql + " Major_leader=" + "\"" + Major_leader + "\""
                sql = sql + " where Major_id=" + "\"" + Major_id + "\""
                print(sql)
                cursor.execute(sql)
                flash("操作成功")
            sql = "select * from Major;"
            cursor.execute(sql)
            res = cursor.fetchall()
        cursor.close()
    else:
        cursor = conn.cursor()
        sql = "select * from Major;"
        cursor.execute(sql)
        res = cursor.fetchall()
        cursor.close()
    return render_template('major.html', major=res)


@app.route('/classes', methods=['GET', 'POST'])
def classes():
    res = []
    if request.method == 'POST':
        print(request.form)
        cursor = conn.cursor()
        op = request.form["query"]
        if op == "insert":
            sql = """
                    insert into Class (Class_id, Class_name, Class_create_date, Class_head_teacher, Class_grade, Class_major) 
                    values (%s, %s, %s, %s, %s, %s);
                    """
            Class_id = request.form["class_id"]
            Class_name = request.form["class_name"]
            Class_create_date = request.form["class_create_date"]
            Class_head_teacher = request.form["class_teacher"]
            Class_grade = request.form["class_grade"]
            Class_major = request.form["class_major"]
            cursor.execute(sql, [Class_id, Class_name, Class_create_date, Class_head_teacher, Class_grade, Class_major])
            flash("操作成功")
            sql = "select * from Class;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "delete":
            sql = """
                delete from Class where Class_id=%s;
                """
            Class_id = request.form["class_id"]
            cursor.execute(sql, Class_id)
            sql = "select * from Class;"
            cursor.execute(sql)
            flash("操作成功")
            res = cursor.fetchall()
        elif op == "select":
            sel = []
            logic = []
            subclause = []
            i = 0
            if "sel0" in request.form:
                sel.append(request.form["sel0"])
            else:
                sel.append("\0")
            while sel[i]:
                subclause.append(request.form["subclause" + str(i)])
                i = i + 1
                if "logic" + str(i) in request.form:
                    logic.append(request.form["logic" + str(i)])
                    sel.append(request.form["sel" + str(i)])
                else:
                    break
            if i == 0:
                sql = "select * from Class"
            else:
                sql = "select * from Class where "
                for j in range(0, i):
                    if sel[j] == "ID":
                        sel[j] = "Class_id"
                    elif sel[j] == "name":
                        sel[j] = "Class_name"
                    elif sel[j] == "createdate":
                        sel[j] = "Class_create_date"
                    elif sel[j] == "headteacher":
                        sel[j] = "Class_head_teacher"
                    elif sel[j] == "grade":
                        sel[j] = "Class_grade"
                    else:
                        sel[j] = "Class_major"
                    sql = sql + sel[j] + "=\"" + subclause[j] + "\""
                    if not j == i - 1:
                        sql = sql + " " + logic[j] + " "
            print(sql)
            cursor.execute(sql)
            flash("操作成功")
            res = cursor.fetchall()
        elif op == "update":
            Class_id = request.form["class_id"]
            Class_name = request.form["class_name"]
            Class_create_date = request.form["class_create_date"]
            Class_head_teacher = request.form["class_teacher"]
            Class_grade = request.form["class_grade"]
            Class_major = request.form["class_major"]
            if not Class_name + Class_create_date + Class_head_teacher + Class_grade + Class_major:
                flash("什么也不做")
            else:
                sql = "update Class set"
                if Class_name:
                    sql = sql + " Class_name=" + "\"" + Class_name + "\""
                    if Class_create_date or Class_head_teacher or Class_grade or Class_major:
                        sql = sql + ","
                if Class_create_date:
                    sql = sql + " Class_create_date=" + "\"" + Class_create_date + "\""
                    if Class_head_teacher or Class_grade or Class_major:
                        sql = sql + ","
                if Class_head_teacher:
                    sql = sql + " Class_head_teacher=" + "\"" + Class_head_teacher + "\""
                    if Class_grade or Class_major:
                        sql = sql + ","
                if Class_grade:
                    sql = sql + " Class_grade=" + "\"" + Class_grade + "\""
                    if Class_major:
                        sql = sql + ","
                if Class_major:
                    sql = sql + " Class_major=" + "\"" + Class_major + "\""
                sql = sql + " where Class_id=" + "\"" + Class_id + "\""
                print(sql)
                cursor.execute(sql)
                flash("操作成功")
            sql = "select * from Class;"
            cursor.execute(sql)
            res = cursor.fetchall()
        cursor.close()
    else:
        cursor = conn.cursor()
        sql = """
            select * from Class;
            """
        cursor.execute(sql)
        res = cursor.fetchall()
        cursor.close()
    return render_template('class.html', classes = res)


@app.route('/student', methods=['GET', 'POST'])
def student():
    res = []
    if request.method == 'POST':
        print(request.form)
        cursor = conn.cursor()
        op = request.form["query"]
        if op == "insert":
            sql = """
                insert into Student (Student_id, Student_person_id, Student_email, Student_class, Student_major_id, Student_time_of_enrollment) 
                values (%s, %s, %s, %s, %s, %s);
                """
            Student_id = request.form["student_id"]
            Student_person_id = request.form["student_person_id"]
            Student_email = request.form["student_email_address"]
            Student_class = request.form["student_class"]
            Student_major_id = request.form["student_major"]
            Student_time_of_enrollment = request.form["student_enrollment"]
            cursor.execute(sql, [Student_id, Student_person_id, Student_email, Student_class, Student_major_id, Student_time_of_enrollment])
            flash("操作成功")
            sql = "select * from Student;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "delete":
            sql = """
                delete from Student where Student_id=%s;
                """
            Student_id = request.form["student_id"]
            cursor.execute(sql, Student_id)
            flash("操作成功")
            sql = "select * from Student;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "select":
            sel = []
            logic = []
            subclause = []
            i = 0
            if "sel0" in request.form:
                sel.append(request.form["sel0"])
            else:
                sel.append("\0")
            while sel[i]:
                subclause.append(request.form["subclause" + str(i)])
                i = i + 1
                if "logic" + str(i) in request.form:
                    logic.append(request.form["logic" + str(i)])
                    sel.append(request.form["sel" + str(i)])
                else:
                    break
            if i == 0:
                sql = "select * from Student"
            else:
                sql = "select * from Student where "
                for j in range(0, i):
                    if sel[j] == "ID":
                        sel[j] = "Student_id"
                    elif sel[j] == "personal ID":
                        sel[j] = "Student_person_id"
                    elif sel[j] == "email":
                        sel[j] = "Student_email"
                    elif sel[j] == "class":
                        sel[j] = "Student_class"
                    elif sel[j] == "major":
                        sel[j] = "Student_major_id"
                    else:
                        sel[j] = "Student_time_of_enrollment"
                    sql = sql + sel[j] + "=\"" + subclause[j] + "\""
                    if not j == i - 1:
                        sql = sql + " " + logic[j] + " "
            print(sql)
            cursor.execute(sql)
            flash("操作成功")
            res = cursor.fetchall()
        elif op == "update":
            Student_id = request.form["student_id"]
            Student_person_id = request.form["student_person_id"]
            Student_email = request.form["student_email_address"]
            Student_class = request.form["student_class"]
            Student_major_id = request.form["student_major"]
            Student_time_of_enrollment = request.form["student_enrollment"]
            if not Student_person_id + Student_email + Student_class + Student_major_id + Student_time_of_enrollment:
                flash("什么也不做")
            else:
                sql = "update Student set"
                if Student_person_id:
                    sql = sql + " Student_person_id=" + "\"" + Student_person_id + "\""
                    if Student_email or Student_class or Student_major_id or Student_time_of_enrollment:
                        sql = sql + ","
                if Student_email:
                    sql = sql + " Student_email=" + "\"" + Student_email + "\""
                    if Student_class or Student_major_id or Student_time_of_enrollment:
                        sql = sql + ","
                if Student_class:
                    sql = sql + " Student_class=" + "\"" + Student_class + "\""
                    if Student_major_id or Student_time_of_enrollment:
                        sql = sql + ","
                if Student_major_id:
                    sql = sql + " Student_major_id=" + "\"" + Student_major_id + "\""
                    if Student_time_of_enrollment:
                        sql = sql + ","
                if Student_time_of_enrollment:
                    sql = sql + " Student_time_of_enrollment=" + "\"" + Student_time_of_enrollment + "\""
                sql = sql + " where Student_id=" + "\"" + Student_id + "\""
                print(sql)
                cursor.execute(sql)
                flash("操作成功")
            sql = "select * from Student;"
            cursor.execute(sql)
            res = cursor.fetchall()
        cursor.close()
    else:
        cursor = conn.cursor()
        sql = "select * from Student;"
        cursor.execute(sql)
        res = cursor.fetchall()
        cursor.close()
    return render_template('student.html', student = res)


@app.route('/personalinfo', methods=['GET', 'POST'])
def personalinfo():
    res = []
    if request.method == 'POST':
        print(request.form)
        cursor = conn.cursor()
        op = request.form["query"]
        if op == "insert":
            sql = """
                insert into Person (Person_id, Person_id_type, Person_name, Person_gender, Person_date_of_birth, Person_nationality) 
                values (%s, %s, %s, %s, %s, %s);
                """
            Person_id = request.form["info_id"]
            Person_id_type = request.form["info_type"]
            if Person_id_type == "creditcard":
                Person_id_type = "身份证"
            else:
                Person_id_type = "护照"
            Person_name = request.form["info_name"]
            Person_gender = request.form["info_gender"]
            if Person_gender == "male":
                Person_gender = "男"
            else:
                Person_gender = "女"
            Person_date_of_birth = request.form["info_birthday"]
            Person_nationality = request.form["info_nationality"]
            Person_address = request.form["info_addr"]
            Person_postcode = request.form["info_postcode"]
            Person_phone_number = request.form["info_phone"]
            cursor.execute(sql, [Person_id, Person_id_type, Person_name, Person_gender, Person_date_of_birth, Person_nationality])
            if Person_address + Person_postcode + Person_phone_number:
                sql = "insert into `Contact information` (Person_id, "
                if Person_address:
                    sql = sql + "Person_address"
                    if Person_postcode or Person_phone_number:
                        sql = sql + ", "
                if Person_postcode:
                    sql = sql + "Person_postcode"
                    if Person_phone_number:
                        sql = sql + ", "
                if Person_phone_number:
                    sql = sql + "Person_phone_number"
                sql = sql + ") values (%s, "
                if Person_address:
                    sql = sql + "\"" + Person_address + "\""
                    if Person_postcode or Person_phone_number:
                        sql = sql + ", "
                if Person_postcode:
                    sql = sql + "\"" + Person_postcode + "\""
                    if Person_phone_number:
                        sql = sql + ", "
                if Person_phone_number:
                    sql = sql + "\"" + Person_phone_number + "\""
                sql = sql + ");"
                cursor.execute(sql, Person_id)
            flash("操作成功")
            sql = "select * from Person natural left join `Contact information`;"
            cursor.execute(sql, Person_id)
            res = cursor.fetchall()
        elif op == "delete":
            Person_id = request.form["info_id"]
            sql = """
                delete from `Contact information` where Person_id=%s;
                """
            cursor.execute(sql, Person_id)
            sql = """
                delete from Person where Person_id=%s;
                """
            cursor.execute(sql, Person_id)
            flash("操作成功")
            sql = "select * from Person natural left join `Contact information`;"
            cursor.execute(sql, Person_id)
            res = cursor.fetchall()
        elif op == "select":
            sel = []
            logic = []
            subclause = []
            i = 0
            if "sel0" in request.form:
                sel.append(request.form["sel0"])
            else:
                sel.append("\0")
            while sel[i]:
                subclause.append(request.form["subclause" + str(i)])
                i = i + 1
                if "logic" + str(i) in request.form:
                    logic.append(request.form["logic" + str(i)])
                    sel.append(request.form["sel" + str(i)])
                else:
                    break
            if i == 0:
                sql = "select * from Person natural left join `Contact information`;"
            else:
                sql = "select * from Person natural left join `Contact information` where "
                for j in range(0, i):
                    if sel[j] == "ID":
                        sel[j] = "Person.Person_id"
                    elif sel[j] == "type":
                        sel[j] = "Person.Person_id_type"
                    elif sel[j] == "name":
                        sel[j] = "Person.Person_name"
                    elif sel[j] == "gender":
                        sel[j] = "Person.Person_gender"
                    elif sel[j] == "birthday":
                        sel[j] = "Person.Person_date_of_birth"
                    elif sel[j] == "nationality":
                        sel[j] = "Person.Person_nationality"
                    elif sel[j] == "addr":
                        sel[j] = "`Contact information`.Person_address"
                    elif sel[j] == "postcode":
                        sel[j] = "`Contact information`.Person_postcode"
                    else:
                        sel[j] = "`Contact information`.Person_phone_number"
                    sql = sql + sel[j] + "=\"" + subclause[j] + "\""
                    if not j == i - 1:
                        sql = sql + " " + logic[j] + " "
            print(sql)
            cursor.execute(sql)
            flash("操作成功")
            res = cursor.fetchall()
        elif op == "update":
            Person_id = request.form["info_id"]
            Person_id_type = request.form["info_type"]
            if Person_id_type == "creaditcard":
                Person_id_type = "身份证"
            else:
                Person_id_type = "护照"
            Person_name = request.form["info_name"]
            Person_gender = request.form["info_gender"]
            if Person_id_type == "male":
                Person_id_type = "男"
            else:
                Person_id_type = "女"
            Person_date_of_birth = request.form["info_birthday"]
            Person_nationality = request.form["info_nationality"]
            Person_address = request.form["info_addr"]
            Person_postcode = request.form["info_postcode"]
            Person_phone_number = request.form["info_phone"]
            if not Person_id_type + Person_name + Person_gender + Person_date_of_birth + Person_nationality \
                   + Person_address + Person_postcode + Person_phone_number:
                flash("什么也不做")
            else:
                if Person_id_type + Person_name + Person_gender + Person_date_of_birth + Person_nationality:
                    sql = "update Person set"
                    if Person_id_type:
                        sql = sql + " Person_id_type=" + "\"" + Person_id_type + "\""
                        if Person_name or Person_gender or Person_date_of_birth or Person_nationality:
                            sql = sql + ","
                    if Person_name:
                        sql = sql + " Person_name=" + "\"" + Person_name + "\""
                        if Person_gender or Person_date_of_birth or Person_nationality:
                            sql = sql + ","
                    if Person_gender:
                        sql = sql + " Person_gender=" + "\"" + Person_gender + "\""
                        if Person_date_of_birth or Person_nationality:
                            sql = sql + ","
                    if Person_date_of_birth:
                        sql = sql + " Person_date_of_birth=" + "\"" + Person_date_of_birth + "\""
                        if Person_nationality:
                            sql = sql + ","
                    if Person_nationality:
                        sql = sql + " Person_nationality=" + "\"" + Person_nationality + "\""
                    sql = sql + " where Person_id=" + "\"" + Person_id + "\""
                    print(sql)
                    cursor.execute(sql)
                if Person_address + Person_postcode + Person_phone_number:
                    sql = "update `Contact information` set"
                    if Person_address:
                        sql = sql + " Person_address=" + "\"" + Person_address + "\","
                    if Person_postcode:
                        sql = sql + " Person_postcode=" + "\"" + Person_postcode + "\""
                    if Person_phone_number:
                        sql = sql + " Person_phone_number=" + "\"" + Person_phone_number + "\""
                    sql = sql + " where Person_id=" + "\"" + Person_id + "\""
                    print(sql)
                    cursor.execute(sql)
                flash("操作成功")
            sql = "select * from Person natural left join `Contact information`;"
            cursor.execute(sql, Person_id)
            res = cursor.fetchall()
        cursor.close()
    else:
        cursor = conn.cursor()
        sql = "select * from Person natural left join `Contact information`;"
        cursor.execute(sql)
        res = cursor.fetchall()
        cursor.close()
    return render_template('personalinfo.html', info = res)


@app.route('/teacher', methods=['GET', 'POST'])
def teacher():
    res = []
    if request.method == 'POST':
        print(request.form)
        cursor = conn.cursor()
        op = request.form["query"]
        if op == "insert":
            sql = """
                insert into Teacher (Teacher_id, Teacher_person_id, Teacher_entry_date, Teacher_email, Teacher_major_id, Teacher_rank) 
                values (%s, %s, %s, %s, %s, %s);
                """
            Teacher_id = request.form["teacher_id"]
            Teacher_person_id = request.form["teacher_person_id"]
            Teacher_entry_date = request.form["teacher_entry"]
            Teacher_email = request.form["teacher_email_address"]
            Teacher_major_id = request.form["teacher_major"]
            Teacher_rank = request.form["teacher_rank"]
            if Teacher_rank == "professor":
                Teacher_rank = "教授"
            else:
                Teacher_rank = "副教授"
            cursor.execute(sql, [Teacher_id, Teacher_person_id, Teacher_entry_date, Teacher_email, Teacher_major_id, Teacher_rank])
            flash("操作成功")
            sql = "select * from Teacher;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "delete":
            sql = """
                delete from Teacher where Teacher_id=%s;
                """
            Teacher_id = request.form["teacher_id"]
            cursor.execute(sql, Teacher_id)
            flash("操作成功")
            sql = "select * from Teacher;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "select":
            sel = []
            logic = []
            subclause = []
            i = 0
            if "sel0" in request.form:
                sel.append(request.form["sel0"])
            else:
                sel.append("\0")
            while sel[i]:
                subclause.append(request.form["subclause" + str(i)])
                i = i + 1
                if "logic" + str(i) in request.form:
                    logic.append(request.form["logic" + str(i)])
                    sel.append(request.form["sel" + str(i)])
                else:
                    break
            if i == 0:
                sql = "select * from Teacher"
            else:
                sql = "select * from Teahcer where "
                for j in range(0, i):
                    if sel[j] == "ID":
                        sel[j] = "Teacher_id"
                    elif sel[j] == "personal ID":
                        sel[j] = "Teacher_person_id"
                    elif sel[j] == "entry":
                        sel[j] = "Teacher_entry_date"
                    elif sel[j] == "email":
                        sel[j] = "Teacher_email"
                    elif sel[j] == "major":
                        sel[j] = "Teacher_major_id"
                    else:
                        sel[j] = "Teacher_rank"
                    sql = sql + sel[j] + "=\"" + subclause[j] + "\""
                    if not j == i - 1:
                        sql = sql + " " + logic[j] + " "
            print(sql)
            cursor.execute(sql)
            flash("操作成功")
            res = cursor.fetchall()
        elif op == "update":
            Teacher_id = request.form["teacher_id"]
            Teacher_person_id = request.form["teacher_person_id"]
            Teacher_entry_date = request.form["teacher_entry"]
            Teacher_email = request.form["teacher_email_address"]
            Teacher_major_id = request.form["teacher_major"]
            Teacher_rank = request.form["teacher_rank"]
            if Teacher_rank == "professor":
                Teacher_rank = "教授"
            else:
                Teacher_rank = "副教授"
            if not Teacher_person_id + Teacher_entry_date + Teacher_email + Teacher_major_id + Teacher_rank:
                flash("什么也不做")
            else:
                sql = "update Teacher set"
                if Teacher_person_id:
                    sql = sql + " Teacher_person_id=" + "\"" + Teacher_person_id + "\""
                    if Teacher_entry_date or Teacher_email or Teacher_major_id or Teacher_rank:
                        sql = sql + ","
                if Teacher_entry_date:
                    sql = sql + " Teacher_entry_date=" + "\"" + Teacher_entry_date + "\""
                    if Teacher_email or Teacher_major_id or Teacher_rank:
                        sql = sql + ","
                if Teacher_email:
                    sql = sql + " Teacher_email=" + "\"" + Teacher_email + "\""
                    if Teacher_major_id or Teacher_rank:
                        sql = sql + ","
                if Teacher_major_id:
                    sql = sql + " Teacher_major_id=" + "\"" + Teacher_major_id + "\""
                    if Teacher_rank:
                        sql = sql + ","
                if Teacher_rank:
                    sql = sql + " Teacher_rank=" + "\"" + Teacher_rank + "\""
                sql = sql + " where Teacher_id=" + "\"" + Teacher_id + "\""
                print(sql)
                cursor.execute(sql)
                flash("操作成功")
            sql = "select * from Teacher;"
            cursor.execute(sql)
            res = cursor.fetchall()
        cursor.close()
    else:
        cursor = conn.cursor()
        sql = "select * from Teacher;"
        cursor.execute(sql)
        res = cursor.fetchall()
        cursor.close()
    return render_template('teacher.html', teacher = res)


@app.route('/course', methods=['GET', 'POST'])
def course():
    res = []
    if request.method == 'POST':
        print(request.form)
        cursor = conn.cursor()
        op = request.form["query"]
        if op == "insert":
            sql = """
                insert into Course (Course_id, Course_name, Course_major_id, Course_evaluation_method) 
                values (%s, %s, %s, %s);
                """
            Course_id = request.form["course_id"]
            Course_name = request.form["course_name"]
            Course_major_id = request.form["course_major"]
            Course_evaluation_method = request.form["course_eval"]
            cursor.execute(sql, [Course_id, Course_name, Course_major_id, Course_evaluation_method])
            flash("操作成功")
            sql = "select * from Course;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "delete":
            sql = """
                delete from Course where Course_id=%s;
                """
            Course_id = request.form["course_id"]
            cursor.execute(sql, Course_id)
            flash("操作成功")
            sql = "select * from Course;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "select":
            sel = []
            logic = []
            subclause = []
            i = 0
            if "sel0" in request.form:
                sel.append(request.form["sel0"])
            else:
                sel.append("\0")
            while sel[i]:
                subclause.append(request.form["subclause" + str(i)])
                i = i + 1
                if "logic" + str(i) in request.form:
                    logic.append(request.form["logic" + str(i)])
                    sel.append(request.form["sel" + str(i)])
                else:
                    break
            if i == 0:
                sql = "select * from Course"
            else:
                sql = "select * from Course where "
                for j in range(0, i):
                    if sel[j] == "ID":
                        sel[j] = "Course_id"
                    elif sel[j] == "name":
                        sel[j] = "Course_name"
                    elif sel[j] == "major":
                        sel[j] = "Course_major_id"
                    else:
                        sel[j] = "Course_evaluation_method"
                    sql = sql + sel[j] + "=\"" + subclause[j] + "\""
                    if not j == i - 1:
                        sql = sql + " " + logic[j] + " "
            print(sql)
            cursor.execute(sql)
            flash("操作成功")
            res = cursor.fetchall()
        elif op == "update":
            Course_id = request.form["course_id"]
            Course_name = request.form["course_name"]
            Course_major_id = request.form["course_major"]
            Course_evaluation_method = request.form["course_eval"]
            if not Course_name + Course_major_id + Course_evaluation_method:
                flash("什么也不做")
            else:
                sql = "update Course set"
                if Course_name:
                    sql = sql + " Course_name=" + "\"" + Course_name + "\""
                    if Course_major_id or Course_evaluation_method:
                        sql = sql + ","
                if Course_major_id:
                    sql = sql + " Course_major_id=" + "\"" + Course_major_id + "\""
                    if Course_evaluation_method:
                        sql = sql + ","
                if Course_evaluation_method:
                    sql = sql + " Course_evaluation_method=" + "\"" + Course_evaluation_method + "\""
                sql = sql + " where Course_id=" + "\"" + Course_id + "\";"
                print(sql)
                cursor.execute(sql)
                flash("操作成功")
            sql = "select * from Course;"
            cursor.execute(sql)
            res = cursor.fetchall()
        cursor.close()
    else:
        cursor = conn.cursor()
        sql = "select * from Course;"
        cursor.execute(sql)
        res = cursor.fetchall()
        cursor.close()
    return render_template('course.html', course = res)


@app.route('/section', methods=['GET', 'POST'])
def section():
    res = []
    if request.method == 'POST':
        print(request.form)
        cursor = conn.cursor()
        op = request.form["query"]
        if op == "insert":
            sql = """
                insert into Section (Course_id, Teacher_id, Year, Semester, Time_slot_id) 
                values (%s, %s, %s, %s, %s);
                """
            Course_id = request.form["course_id"]
            Teacher_id = request.form["teacher_id"]
            Year = request.form["section_year"]
            Semester = request.form["section_seme"]
            Time_slot_id = request.form["section_time"]
            cursor.execute(sql, [Course_id, Teacher_id, Year, Semester, Time_slot_id])
            flash("操作成功")
            sql = "select Course_id, Teacher_id, Year, Semester, Day, Piece  from Section natural left join Time_slot;"
            res = cursor.fetchall()
        elif op == "delete":
            Course_id = request.form["course_id"]
            Teacher_id = request.form["teacher_id"]
            Year = request.form["section_year"]
            Semester = request.form["section_seme"]
            sql = """
                delete from Section where Course_id=%s and Teacher_id=%s and Year=%s and Semester=%s;
                """
            cursor.execute(sql, [Course_id, Teacher_id, Year, Semester])
            flash("操作成功")
            sql = "select Course_id, Teacher_id, Year, Semester, Day, Piece  from Section natural left join Time_slot;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "select":
            sel = []
            logic = []
            subclause = []
            i = 0
            if "sel0" in request.form:
                sel.append(request.form["sel0"])
            else:
                sel.append("\0")
            while sel[i]:
                subclause.append(request.form["subclause" + str(i)])
                i = i + 1
                if "logic" + str(i) in request.form:
                    logic.append(request.form["logic" + str(i)])
                    sel.append(request.form["sel" + str(i)])
                else:
                    break
            if i == 0:
                sql = "select Course_id, Teacher_id, Year, Semester, Day, Piece  from Section natural left join Time_slot;"
            else:
                sql = "select Course_id, Teacher_id, Year, Semester, Day, Piece  from Section natural left join Time_slot where "
                for j in range(0, i):
                    if sel[j] == "courseid":
                        sel[j] = "Section.Course_id"
                    elif sel[j] == "teacherid":
                        sel[j] = "Section.Teacher_id"
                    elif sel[j] == "year":
                        sel[j] = "Section.Year"
                    elif sel[j] == "seme":
                        sel[j] = "Section.Semester"
                    elif sel[j] == "weekday":
                        sel[j] = "Time_slot.Day"
                    else:
                        sel[j] = "Time_slot.Piece"
                    sql = sql + sel[j] + "=\"" + subclause[j] + "\""
                    if not j == i - 1:
                        sql = sql + " " + logic[j] + " "
            print(sql)
            cursor.execute(sql)
            flash("操作成功")
            res = cursor.fetchall()
        elif op == "update":
            Course_id = request.form["course_id"]
            Teacher_id = request.form["teacher_id"]
            Year = request.form["section_year"]
            Semester = request.form["section_seme"]
            Time_slot_id = request.form["section_time"]
            if not Time_slot_id:
                flash("什么也不做")
            else:
                sql = "update Section set Time_slot_id=%s where Course_id=%s and Teacher_id=%s and Year=%s and Semester=%s"
                print(sql)
                cursor.execute(sql, [Time_slot_id, Course_id, Teacher_id, Year, Semester])
                flash("操作成功")
            sql = "select Course_id, Teacher_id, Year, Semester, Day, Piece  from Section natural left join Time_slot;"
            cursor.execute(sql, Person_id)
            res = cursor.fetchall()
        cursor.close()
    else:
        cursor = conn.cursor()
        sql = "select Course_id, Teacher_id, Year, Semester, Day, Piece  from Section natural left join Time_slot;"
        cursor.execute(sql)
        res = cursor.fetchall()
        cursor.close()
    return render_template('section.html', section = res)


@app.route('/takes', methods=['GET', 'POST'])
def takes():
    res = []
    if request.method == 'POST':
        print(request.form)
        cursor = conn.cursor()
        op = request.form["query"]
        if op == "insert":
            Student_id = request.form["student_id"]
            Section_Course_id = request.form["course_id"]
            Section_Teacher_id = request.form["teacher_id"]
            Section_Year = request.form["section_year"]
            Section_Semester = request.form["section_seme"]
            Grade = request.form["takes_grade"]
            sql = """
                insert into Takes (Student_id, Section_Course_id, Section_Teacher_id, Section_Year, Section_Semester, Grade) 
                values (%s, %s, %s, %s
                """
            if not Grade:
                sql = sql + ", " + Grade + + ");"
            else:
                sql = sql + ");"
            cursor.execute(sql, [Student_id, Section_Course_id, Section_Teacher_id, Section_Year, Section_Semester])
            flash("操作成功")
            sql = "select * from Takes;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "delete":
            Student_id = request.form["student_id"]
            Section_Course_id = request.form["course_id"]
            Section_Teacher_id = request.form["teacher_id"]
            Section_Year = request.form["section_year"]
            Section_Semester = request.form["section_seme"]
            sql = """
                delete from Section where Student_id=%s and Section_Course_id=%s and Section_Teacher_id=%s and Section_Year=%s 
                and Section_Semester=%s;
                """
            cursor.execute(sql, [Student_id, Section_Course_id, Section_Teacher_id, Section_Year, Section_Semester])
            flash("操作成功")
            sql = "select * from Takes;"
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "select":
            sel = []
            logic = []
            subclause = []
            i = 0
            if "sel0" in request.form:
                sel.append(request.form["sel0"])
            else:
                sel.append("\0")
            while sel[i]:
                subclause.append(request.form["subclause" + str(i)])
                i = i + 1
                if "logic" + str(i) in request.form:
                    logic.append(request.form["logic" + str(i)])
                    sel.append(request.form["sel" + str(i)])
                else:
                    break
            if i == 0:
                sql = "select * from Takes;"
            else:
                sql = "select * from Takes where "
                for j in range(0, i):
                    if sel[j] == "studentid":
                        sel[j] = "Student_id"
                    elif sel[j] == "courseid":
                        sel[j] = "Section_Course_id"
                    elif sel[j] == "teacherid":
                        sel[j] = "Section_Teacher_id"
                    elif sel[j] == "year":
                        sel[j] = "Section_Year"
                    elif sel[j] == "seme":
                        sel[j] = "Section_Semester"
                    else:
                        sel[j] = "Grade"
                    if sel[j] == "Grade":
                        sql = sql + sel[j] + "=" + subclause[j]
                    else:
                        sql = sql + sel[j] + "=\"" + subclause[j] + "\""
                    if not j == i - 1:
                        sql = sql + " " + logic[j] + " "
            print(sql)
            cursor.execute(sql)
            flash("操作成功")
            res = cursor.fetchall()
        elif op == "update":
            Student_id = request.form["student_id"]
            Section_Course_id = request.form["course_id"]
            Section_Teacher_id = request.form["teacher_id"]
            Section_Year = request.form["section_year"]
            Section_Semester = request.form["section_seme"]
            Grade = request.form["takes_grade"]
            if not Grade:
                flash("什么也不做")
            else:
                sql = "update Takes set Grade=" + Grade + " where Student_id=%s and Section_Course_id=%s " \
                                                          "and Section_Teacher_id=%s and Section_Year=%s and Section_Semester=%s"
                print(sql)
                cursor.execute(sql, [Student_id, Section_Course_id, Section_Teacher_id, Section_Year, Section_Semester])
                flash("操作成功")
            sql = "select * from Takes;"
            cursor.execute(sql)
            res = cursor.fetchall()
        cursor.close()
    else:
        cursor = conn.cursor()
        sql = "select * from Takes;"
        cursor.execute(sql)
        res = cursor.fetchall()
        cursor.close()
    return render_template('takes.html', takes = res)


@app.route('/changestatus', methods=['GET', 'POST'])
def changestatus():
    res = []
    if request.method == 'POST':
        print(request.form)
        cursor = conn.cursor()
        op = request.form["query"]
        if op == "insert":
            Change_id = request.form["change_id"]
            Change_date = request.form["change_date"]
            Original_class_id = request.form["orig_class"]
            Current_class_id = request.form["curr_calss"]
            Change_type = request.form["change_type"]
            Student_id = request.form["student_id"]
            Change_detail = request.form["change_detail"]
            sql = """
                insert into `Student status change` (Change_id, Change_date, Original_class_id, Current_class_id, Change_type) 
                values (%s, %s, %s, %s, %s);
                """
            cursor.execute(sql, [Change_id, Change_date, Original_class_id, Current_class_id, Change_type])
            if Change_type == "专业":
                sql = """
                    insert into `Student major change` (Change_id, Student_id, Change_league_member) 
                    values (%s, %s, %s);
                    """
                cursor.execute(sql, [Change_id, Student_id, Change_detail])
            else:
                sql = """
                    insert into `Student grade change` (Change_id, Student_id, Change_reason) 
                    values (%s, %s, %s);
                    """
                cursor.execute(sql, [Change_id, Student_id, Change_detail])
            flash("操作成功")
            sql = """
            select *  from (`Student status change` natural left join `Student major change`) 
            natural left join `Student grade change`;
            """
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "delete":
            Change_id = request.form["change_id"]
            sql = """
                delete from `Student status change` where Change_id=%s;
                """
            cursor.execute(sql, Change_id)
            flash("操作成功")
            sql = """
            select *  from (`Student status change` natural left join `Student major change`) 
            natural left join `Student grade change`;
            """
            cursor.execute(sql)
            res = cursor.fetchall()
        elif op == "select":
            sel = []
            logic = []
            subclause = []
            i = 0
            if "sel0" in request.form:
                sel.append(request.form["sel0"])
            else:
                sel.append("\0")
            while sel[i]:
                subclause.append(request.form["subclause" + str(i)])
                i = i + 1
                if "logic" + str(i) in request.form:
                    logic.append(request.form["logic" + str(i)])
                    sel.append(request.form["sel" + str(i)])
                else:
                    break
            if i == 0:
                sql = """
                select *  from (`Student status change` natural left join `Student major change`) 
                natural left join `Student grade change`;
                """
            else:
                sql = """
                select *  from (`Student status change` natural left join `Student major change`) 
                natural left join `Student grade change` where 
                """
                for j in range(0, i):
                    if sel[j] == "changeid":
                        sel[j] = "Change_id"
                    elif sel[j] == "date":
                        sel[j] = "Change_date"
                    elif sel[j] == "orig":
                        sel[j] = "Original_class_id"
                    elif sel[j] == "curr":
                        sel[j] = "Current_class_id"
                    else:
                        sel[j] = "Change_type"
                    sql = sql + sel[j] + "=\"" + subclause[j] + "\""
                    if not j == i - 1:
                        sql = sql + " " + logic[j] + " "
            print(sql)
            cursor.execute(sql)
            flash("操作成功")
            res = cursor.fetchall()
        elif op == "update":
            Change_id = request.form["change_id"]
            Change_date = request.form["change_date"]
            Original_class_id = request.form["orig_class"]
            Current_class_id = request.form["curr_calss"]
            Change_type = request.form["change_type"]
            Student_id = request.form["student_id"]
            Change_detail = request.form["change_detail"]
            if not Change_date + Original_class_id + Current_class_id + Change_type + Student_id + Change_detail:
                flash("什么也不做")
            else:
                if Original_class_id + Original_class_id + Current_class_id + Change_type:
                    sql = "update `Student status change` set"
                    if Change_date:
                        sql = sql + " Change_date=" + "\"" + Change_date + "\""
                        if Original_class_id + Original_class_id + Current_class_id + Change_type:
                            sql = sql + ","
                    if Original_class_id:
                        sql = sql + " Original_class_id=" + "\"" + Original_class_id + "\""
                        if Current_class_id + Change_type:
                            sql = sql + ","
                    if Current_class_id:
                        sql = sql + " Current_class_id=" + "\"" + Current_class_id + "\""
                        if Change_type:
                            sql = sql + ","
                    if Change_type:
                        sql = sql + " Change_type=" + "\"" + Change_type + "\""
                    sql = sql + " where Change_id=" + "\"" + Change_id + "\";"
                    print(sql)
                    cursor.execute(sql, [Change_date, Original_class_id, Current_class_id, Change_type, Change_id])
                if Student_id + Change_detail:
                    if Change_type == "专业":
                        sql = "update `Student major change` set"
                        if Student_id:
                            sql = sql + " Student_id=" + "\"" + Student_id + "\""
                            if Change_detail:
                                sql = sql + ","
                        if Change_detail:
                            sql = sql + " Change_league_member=" + "\"" + Change_detail + "\""
                        sql = sql + " where Change_id=" + "\"" + Change_id + "\";"
                    else:
                        sql = "update `Student grade change` set"
                        if Student_id:
                            sql = sql + " Student_id=" + "\"" + Student_id + "\""
                            if Change_detail:
                                sql = sql + ","
                        if Change_detail:
                            sql = sql + " Change_reason=" + "\"" + Change_detail + "\""
                        sql = sql + " where Change_id=" + "\"" + Change_id + "\";"
                    print(sql)
                    cursor.execute(sql, [Student_id, Change_detail, Change_id])
                flash("操作成功")
            sql = "select Course_id, Teacher_id, Year, Semester, Day, Piece  from Section natural left join Time_slot;"
            cursor.execute(sql, Person_id)
            res = cursor.fetchall()
        cursor.close()
    else:
        cursor = conn.cursor()
        sql = """
        select *  from (`Student status change` natural left join `Student major change`) 
        natural left join `Student grade change`;
        """
        cursor.execute(sql)
        res = cursor.fetchall()
        cursor.close()
    return render_template('changestatus.html', change = res)


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)
