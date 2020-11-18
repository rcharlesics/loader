#ifndef ARCDATA_H
#define ARCDATA_H

#include <QNetworkAccessManager>
#include <QObject>
#include <QVariantMap>

class ArcData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantMap json READ json NOTIFY jsonChanged)
    Q_PROPERTY(QUrl source READ source WRITE setSource NOTIFY sourceChanged)

public:
    ArcData();
    void parseJson(const QByteArray& jsonData);

    QVariantMap json() const;
    QUrl source() const;
    void setSource(QUrl source);
    Q_INVOKABLE void refresh();
signals:
    void jsonChanged();
    void sourceChanged(QUrl source);

private slots:
  void onReplyFinished();

private:
  QNetworkAccessManager manager;
  QNetworkReply * m_reply;
  QVariantMap m_json;
  QUrl m_source;


};

#endif // ARCDATA_H
