#ifndef PERSON_H
#define PERSON_H

#include <QObject>

class Person : public QObject
{
    Q_OBJECT
public:
    explicit Person(QString names,QString favoriteColor,int age,QObject *parent = nullptr);

    Q_PROPERTY(int age READ age WRITE setAge NOTIFY ageChanged)
    Q_PROPERTY(QString favoriteColor READ favoriteColor WRITE setFavoriteColor NOTIFY favoriteColorChanged)
    Q_PROPERTY(QString names READ names WRITE setNames NOTIFY namesChanged)
    int age() const;
    void setAge(int newAge);

    const QString &favoriteColor() const;
    void setFavoriteColor(const QString &newFavoriteColor);

    const QString &names() const;
    void setNames(const QString &newNames);

public slots:
signals:

    void ageChanged();
    void favoriteColorChanged();

    void namesChanged();

private:
    int m_age;
    QString m_favoriteColor;
    QString m_names;
};

#endif // PERSON_H
