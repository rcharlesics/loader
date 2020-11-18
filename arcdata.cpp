#include "arcdata.h"
#include <QtDebug>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonObject>





ArcData::ArcData()
{}

void ArcData::parseJson(const QByteArray& jsonData)
{
    qDebug() << "parseJson is called";
   QJsonParseError jerror;
   QJsonDocument doc = QJsonDocument::fromJson(jsonData,&jerror);
   if (jerror.error != QJsonParseError::NoError)
   {
       qDebug() << "jsonError was found";
       return;
   }
   m_json = doc.object().toVariantMap();
   qDebug() << m_json;
   emit jsonChanged();

}

QVariantMap ArcData::json() const
{
    return m_json;
}

QUrl ArcData::source() const
{
    return m_source;
}

void ArcData::setSource(QUrl source)
{
    if (m_source == source)
        return;

    m_source = source;
    emit sourceChanged(m_source);
    this->refresh();
}

void ArcData::refresh()
{
    if (m_source.isValid())
    {
        m_reply = manager.get(QNetworkRequest(m_source));
        connect(m_reply, &QNetworkReply::finished,
                this, &ArcData::onReplyFinished);
        qDebug() << "ran refresh with valid source";

    }
    else{
        qDebug() << "ran refresh with no source";
    }

}

void ArcData::onReplyFinished()
{
    if (m_reply->error()){
        qDebug() << "Ran into error with reply";
        return;
    }
    parseJson(m_reply->readAll());


}

