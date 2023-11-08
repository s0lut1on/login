
#ifndef MAINSCREEN_H
#define MAINSCREEN_H

#include <qqml.h>
#include <QObject>
#include <QAbstractTableModel>
#include <QJsonArray>
#include <QJsonObject>


class TableModel : public QAbstractTableModel
{
    Q_OBJECT
    QML_ELEMENT
    QML_ADDED_IN_MINOR_VERSION(1)
public:
    TableModel() {
        listStudents.push_back(QJsonObject {
            {"ma", "123"},
            {"ten", "Nguyễn Văn A"},
            {"khoa", "Điện - điện tử"},
            {"nganh", "Công nghệ kỹ thuật máy tính"},
            {"gioitinh", "nam"}
        });
        listStudents.push_back(QJsonObject {
            {"ma", "124"},
            {"ten", "Nguyễn Văn B"},
            {"khoa", "Điện - điện tử"},
            {"nganh", "Công nghệ kỹ thuật máy tính"},
            {"gioitinh", "nam"}
        });
        listStudents.push_back(QJsonObject {
            {"ma", "125"},
            {"ten", "Nguyễn Văn C"},
            {"khoa", "Điện - điện tử"},
            {"nganh", "Hệ thống nhúng và IoT"},
            {"gioitinh", "nam"}
        });
        listStudents.push_back(QJsonObject {
            {"ma", "126"},
            {"ten", "Nguyễn Văn D"},
            {"khoa", "Điện - điện tử"},
            {"nganh", "Hệ thống nhúng và IoT"},
            {"gioitinh", "nam"}
        });
        listStudents.push_back(QJsonObject {
            {"ma", "127"},
            {"ten", "Nguyễn Văn E"},
            {"khoa", "Điện - điện tử"},
            {"nganh", "Hệ thống nhúng và IoT"},
            {"gioitinh", "nam"}
        });
    }
    int rowCount(const QModelIndex & = QModelIndex()) const override
    {
        return listStudents.size() + 1;
    }

    int columnCount(const QModelIndex & = QModelIndex()) const override
    {
        return 6;
    }

    QVariant data(const QModelIndex &index, int role) const override
    {
//        qDebug() << "role: " << role;
        switch (role) {
        case 0:
            if (index.column() == 0 && index.row() == 0) {
                return "Index";
            } else if (index.column() == 1 && index.row() == 0) {
                return "Mã SV";
            } else if (index.column() == 2 && index.row() == 0) {
                return "Tên SV";
            } else if (index.column() == 3 && index.row() == 0) {
                return "Khoa";
            } else if (index.column() == 4 && index.row() == 0) {
                return "Ngành";
            } else if (index.column() == 5 && index.row() == 0) {
                return "Giới tính";
            } else if (index.column() == 0) {
                return QString::number(index.row());
            } else if (index.column() == 1) {
                return listStudents.at(index.row() - 1).toObject()["ma"].toString();
            } else if (index.column() == 2) {
                return listStudents.at(index.row() - 1).toObject()["ten"].toString();
            } else if (index.column() == 3) {
                return listStudents.at(index.row() - 1).toObject()["khoa"].toString();
            } else if (index.column() == 4) {
                return listStudents.at(index.row() - 1).toObject()["nganh"].toString();
            } else if (index.column() == 5) {
                return listStudents.at(index.row() - 1).toObject()["gioitinh"].toString();
            }
            return "Empty";
        default:
            break;
        }

        return QVariant();
    }

    QHash<int, QByteArray> roleNames() const override
    {
        return {
            {0, "display"}
        };
    }
private:
    QJsonArray listStudents;
};

class MainScreen : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList listKhoa MEMBER m_listKhoa NOTIFY listKhoaChanged)

public:
    MainScreen();

public slots:
    QStringList getListNganh(QString khoa);

signals:
    void listKhoaChanged(QStringList);

private:
    QStringList m_listKhoa;


};

#endif // MAINSCREEN_H
