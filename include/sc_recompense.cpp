/**
 *
 * @File : sc_recompense.cpp
 *
 * @Authors : Wilibald09
 *
 * @Date : 29/08/2008
 *
 * @Version : 1.2
 *
 **/


#include "precompiled.h"
#include "sc_recompense.h"
#include "ProgressBar.h"

#define TELE    nsRec::CatRec
#define REC     nsRec::Rec
#define PAGE    nsRec::Page
#define PAGEI   PAGE::Instance


nsRec::VCatRec nsRec::TabCatRec;
nsRec::VItemR  nsRec::TabItemR;

const uint32 PAGE::operator [] (Player * const player) const
{
    for (VInst_t i(0); i < m_TabInstance.size(); ++i)
    {
        if (m_TabInstance[i].GetPlayer() == player)
            return m_TabInstance[i].GetPageId();
    }
    return 0;
}

PAGE::Instance & PAGE::operator () (Player * const player)
{
    for (VInst_t i(0); i < m_TabInstance.size(); ++i)
    {
        if (m_TabInstance[i].GetPlayer() == player)
            return m_TabInstance[i];
    }
    m_TabInstance.push_back(Instance(player));
    return m_TabInstance.back();
}

PAGE::Instance & PAGEI::operator = (const uint32 &id)
{
    m_PageId = id;
    return *this;
}

PAGE::Instance & PAGEI::operator ++ (void)
{
    ++m_PageId;
    return *this;
}

PAGE::Instance PAGEI::operator ++ (int32)
{
    Instance tmp (*this);
    ++m_PageId;
    return tmp;
}

PAGE::Instance & PAGEI::operator -- (void)
{
    --m_PageId;
    return *this;
}

PAGE::Instance PAGEI::operator -- (int32)
{
    Instance tmp (*this);
    --m_PageId;
    return tmp;
}

TELE::CatRec(const uint32 &id, const std::string &name)
    : m_id(id), m_name(name)
{
    m_liste.clear();
}

void LoadRecompense(QueryResult *result)
{
    const char *Table[] =
    {
        "recompense_category",
        "recompense_content",
    };

    // Recuperation items a echanger
    /*result = SD2Database.PQuery("SELECT `entry`, `name` FROM %s", Table[2]);

    nsRec::TabItemR.clear();

    if (result)
    {
        outstring_log( "SD2: Loading %s...", Table[2]);
        barGoLink bar(result->GetRowCount());

        uint32 nbItem = result->GetRowCount();

        do
        {
            bar.step();
            Field *fields = result->Fetch();

            nsRec::ItemR item (fields[0].GetUInt32(), fields[1].GetCppString());
            nsRec::TabItemR.push_back(item);
        } while (result->NextRow());

        delete result;
        outstring_log("");
        outstring_log("SD2: >> Loaded %u %s.", nbItem, Table[2]);
    } else outstring_log("SD2: WARNING >> Loaded 0 %s.", Table[2]);*/

    // Recuperation categorie/recompense
    result = SD2Database.PQuery(
        "SELECT `catid`, C.`name` `namecat`, `entry`, I.`name` `nameitem`, `cost`, `currency` "
        //      0        1                   2        3                    4       5
        "FROM `%s` C, `%s` I "
        "WHERE `id` = `catid` ORDER BY `namecat`, `cost`, `nameitem`", Table[0], Table[1]);

    nsRec::TabCatRec.clear();

    if (result)
    {
        outstring_log( "SD2: Loading %s and %s...", Table[0], Table[1]);
        barGoLink bar(result->GetRowCount());

        uint32 catid = 0;
        uint32 nbItem = 0;
        bool FirstTime = true;

        do
        {
            bar.step();
            Field *fields = result->Fetch();

            nsRec::CatRec categorie (fields[0].GetUInt32(), fields[1].GetCppString());

            if (catid != categorie.GetCatId() || FirstTime)
            {
                FirstTime = false;
                catid = fields[0].GetUInt32();
                nsRec::TabCatRec.push_back(categorie);
            }
            
            nsRec::Rec item (fields[2].GetUInt32(), fields[3].GetCppString(),
                             fields[4].GetUInt32(), fields[5].GetUInt32());

            nsRec::TabCatRec.back().AddItem(item);
            ++nbItem;
        } while (result->NextRow());

        delete result;
        outstring_log("");
        outstring_log("SD2: >> Loaded %u npc_recompense.", nbItem);
    } else outstring_log("SD2: WARNING >> Loaded 0 npc_recompense.");
}

#undef TELE
#undef PAGE
#undef PAGEI
#undef REC