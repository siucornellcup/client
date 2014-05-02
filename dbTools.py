"""
Bulk loads data into the database.
Functions provided for bulk loading doctors, patients, and nurses tables.
Functions provided for clearing all rows from doctors, patients and nurses tables.

Lots of repetition in this script as there is no easy way to pass table and field names as parameters

Don't forget to conn.close() and cur.close()
"""

from faker import Factory
import psycopg2
import patient
gender = ['Male','Female']
#These ethnicities are taken from the US Census.
ethnicity = ['White','Black','American Indian',
			 'Asian Indian','Chinese','Filipino',
			 'Other Asian','Japanese','Korean',
			 'Vietnamese','Native Hawaiian','Guamanian',
			 'Samoan','Other Pacific Islander','Other']
fake = Factory.create()

num_records = 1000
id_photo = open("test_img.jpg","rb").read()

def dblogin():
	conn = psycopg2.connect("dbname=postgres user=postgres password=hi host=localhost port=5432")
	cur = conn.cursor()
	return conn, cur

def load_patients(num_records):
	insertions = 0
	while insertions < num_records:
		name = fake.name()
		village = fake.city()
		dob = fake.date(pattern="%Y-%m-%d")
		gend = fake.random_element(gender)
		ethn = fake.random_element(ethnicity)
		fp_hash = fake.md5(raw_output=False)
		cur.execute("""INSERT INTO clinic.patients(name, village, dob, gender,
		 ethnicity, fingerprint_hash, id_photo) VALUES (%s, %s, %s, %s, %s, %s, %s)""", 
												    (name,
												     village, 
												     dob,
												     gend,
												     ethn,
												     fp_hash,
												     psycopg2.Binary(id_photo)))
		print "Status: " + cur.statusmessage
		conn.commit()
		insertions += 1
		print "Inserted %s into the database\n"%name

def load_nurses(num_records):
	conn, cur = dblogin()
	insertions = 0
	while insertions < num_records:
		name = fake.name()
		village = fake.city()
		dob = fake.date(pattern="%Y-%m-%d")
		gend = fake.random_element(gender)
		fp_hash = fake.md5(raw_output=False)
		cur.execute("""INSERT INTO clinic.nurses(name, village, dob, gender, 
			fingerprint_hash, id_photo) VALUES (%s, %s, %s, %s, %s, %s)""", 
												    (name,
												     village, 
												     dob,
												     gend,
												     fp_hash,
												     psycopg2.Binary(id_photo)))
		print "Status: " + cur.statusmessage
		conn.commit()
		insertions += 1
		print "Inserted %s into the database\n"%name
		

def load_doctors(num_records):
	insertions = 0
	while insertions < num_records:
		first_name = fake.first_name()
		last_name = fake.last_name()
		city = fake.fake.city_name()
		email = fake.company_email()
		password = fake.md5(raw_output=False)
		doc_id = fake.md5(raw_output=False)
		cur.execute("INSERT INTO clinic.doctors(first_name, last_name, location, email) VALUES (%s, %s, %s, %s, %s)", 
												    (first_name, last_name, city, email 
												     ,))
		print "Status: " + cur.statusmessage
		conn.commit()
		insertions += 1
		print "Inserted %s into the database\n"%name

def clear_doctors():
	conn, cur = dblogin()
	cur.execute("DELETE FROM clinic.doctors")
	conn.commit()
	cur.close()
	conn.close()

def clear_patients():
	conn, cur = dblogin()
	cur.execute("DELETE FROM clinic.patients")
	conn.commit()
	cur.close()
	conn.close()
	
def clear_nurses():
	conn, cur = dblogin()
	cur.execute("DELETE FROM clinic.nurses")
	conn.commit()
	cur.close()
	conn.close()

def nurse_lookup_fp(fingerprint):
	conn, cur = dblogin()
	cur.execute("SELECT * FROM clinic.nurses WHERE fingerprint_hash = %s",(fingerprint,))
	result = cur.fetchone()
	colnames = [description[0] for description in cur.description]
	cur.close()
	conn.close()
	if result != None:
		dict_record = dict(zip(colnames,result))
		return dict_record
	else:
		return None

def nurse_userpass_lookup(name):
	conn, cur = dblogin()
	cur.execute("SELECT * FROM clinic.nurses WHERE name = %s",(name,))
	result = cur.fetchone()
	colnames = [description[0] for description in cur.description]
	cur.close()
	conn.close()
	if result != None:
		dict_record = dict(zip(colnames,result))
		return dict_record
	else:
		return None

def get_all_patients():
	conn, cur = dblogin()
	cur.execute("SELECT * FROM clinic.patients")
	result = cur.fetchall()
	num_records = cur.rowcount
	colnames = [description[0] for description in cur.description]
	patient_list = [patient.Patient() for i in range(num_records)]
	mt_list = []
	for r in result:
		g = zip(colnames, r)
		mt_list.append(g)
	i = -1
	while i < num_records-1:
		for attrs in mt_list:
			i += 1
			for el in attrs:
				setattr(patient_list[i],el[0],el[1])
	cur.close()
	conn.close()
	return patient_list


def create_patient(first_name, last_name, village, gender, fingerprint, pending_visit):
	conn, cur = dblogin()
	cur.execute("""INSERT INTO clinic.patients(first_name, last_name, village, gender, fingerprint_hash, pending_visit) 
					VALUES (%s, %s, %s, %s, %s, %s)""", (first_name, last_name, village, gender, fingerprint, pending_visit)) 
	conn.commit()
	cur.close()
	conn.close()
#Dummy fingerprint: 00372a6fb1a467b54992df4daf0dfa49
#Dummy username: Dane Haag
#Dummy pw: 12345     also the same password to my luggage
