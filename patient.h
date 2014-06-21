#ifndef PATIENT_H
#define PATIENT_H

#include <QObject>
#include <iostream>
class Patient : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString firstName READ firstName WRITE setFirstName NOTIFY firstNameChanged)

public:
    explicit Patient(QObject *parent = 0);
    Q_INVOKABLE void setFirstName(const QString &name);
    Q_INVOKABLE void setLastName(const QString &name);
    Q_INVOKABLE void setVillage(const QString &v);
//    Q_INVOKABLE void setGender(const QString &g);

    QString firstName() const;
    QString lastName() const;
    QString village() const;
//    QString gender() const;

signals:
void firstNameChanged();
void lastNameChanged();
void genderChanged();
void villageChanged();

public slots:

private:
    QString p_firstName;
    QString p_lastName;
    QString p_village;
    QString p_gender;
};

#endif // PATIENT_H
