#include "person.h"

Person::Person(QString names,QString favoriteColor,int age,QObject *parent)
    : QObject{parent}
    ,m_age{age}
    ,m_favoriteColor{favoriteColor}
    ,m_names{names}

{

}

int Person::age() const
{
    return m_age;
}

void Person::setAge(int newAge)
{
    if (m_age == newAge)
        return;
    m_age = newAge;
    emit ageChanged();
}

const QString &Person::favoriteColor() const
{
    return m_favoriteColor;
}

void Person::setFavoriteColor(const QString &newFavoriteColor)
{
    if (m_favoriteColor == newFavoriteColor)
        return;
    m_favoriteColor = newFavoriteColor;
    emit favoriteColorChanged();
}

const QString &Person::names() const
{
    return m_names;
}

void Person::setNames(const QString &newNames)
{
    if (m_names == newNames)
        return;
    m_names = newNames;
    emit namesChanged();
}
