#include "patient.h"

Patient::Patient(QObject *parent) : QObject(parent)
{
    p_firstName = "First Name";
    p_lastName = "Last Name";
    p_village = "Village";

}

// Setter Methods
void Patient::setFirstName(const QString &name) {
    std::cout << "First Name Changed" << std::endl;
    if(name != p_firstName)
    {
        p_firstName = name;
        emit firstNameChanged();
    }
}

void Patient::setLastName(const QString &name) {
    if(name != p_lastName)
    {
        p_lastName = name;
        emit lastNameChanged();
    }
}

void Patient::setVillage(const QString &v) {
    if(v != p_village)
    {
        p_village = v;
        emit villageChanged();
    }
}

// Getter Methods
QString Patient::firstName() const {
    return p_firstName;
}

QString Patient::lastName() const {
    return p_lastName;
}

QString Patient::village() const {
    return p_village;
}
