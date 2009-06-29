/**
 *
 * @File : sc_recompense.h
 *
 * @Authors : Wilibald09
 *
 * @Date : 15/08/2008
 *
 * @Version : 1.2
 *
 * @Synopsis : Definition de la classe Recompense permettant d'aider au developpement du script npc_recompense.cpp.
 *
 **/


#ifndef SC_RECOMPENSE_H
#define SC_RECOMPENSE_H

#include <vector>


namespace nsRec
{
    class  CatRec;
    struct ItemR;

    typedef std::vector <CatRec> VCatRec;
    typedef VCatRec::size_type   VCatRec_t;
    typedef std::vector <ItemR>  VItemR;
    typedef VItemR::size_type    VItemR_t;

    extern VCatRec TabCatRec;
    extern VItemR  TabItemR;

    // Structure representant les items recompenses
    struct ItemR
    {
        ItemR(const uint32 &entry, const std::string &name)
            : m_entry(entry), m_name(name) {}

        uint32      m_entry;
        std::string m_name;
    };

    // Structure representant les items "money"
    struct Rec : ItemR
    {
        Rec(const uint32 &entry, const std::string &name, const uint32 &cost, const uint32 &itemCurrencyID)
            : ItemR(entry, name), m_cost(cost) {}

        uint32 m_cost;
    };

    // Classe representant les categories de recompenses
    class CatRec
    {
      public:

        typedef std::vector<Rec> VRec;
        typedef VRec::size_type  VRec_t;

        CatRec(const uint32 &id, const std::string &name);

        void AddItem        (const Rec &item)        { m_liste.push_back(item); }
        Rec  GetItem        (const uint32 &id) const { return m_liste[id]; }
        std::string GetName (void)             const { return m_name; }
        uint32 GetCatId     (void)             const { return m_id; }
        uint32 size         (void)             const { return m_liste.size(); }

      private:

        uint32      m_id;
        std::string m_name;
        VRec        m_liste;
    };

    // Classe qui instancie les pages courantes des joueurs
    class Page
    {
      protected:

        // Classe instanciant une page associe a un joueur
        class Instance
        {
          public:

            Instance(Player * const player, const uint32 &PageId = 0)
                : m_player(player), m_PageId(PageId) {}

            Instance & operator =  (const uint32 &id);
            Instance & operator ++ (void);
            Instance   operator ++ (int32);
            Instance & operator -- (void);
            Instance   operator -- (int32);

            uint32   GetPageId(void) const { return m_PageId; }
            Player * GetPlayer(void) const { return m_player; }
        
          private:

            Player *m_player;
            uint32  m_PageId;
        };


      public:

        typedef std::vector<Instance> VInst;
        typedef VInst::size_type      VInst_t;

        Page(void) { m_TabInstance.clear(); }

        Instance &   operator () (Player * const player);
        const uint32 operator [] (Player * const player) const;


      private:

        VInst m_TabInstance;
    };
}

// Fonction de chargement du contenu de la Base de donnees 
void LoadRecompense(QueryResult*);

extern DatabaseType SD2Database;

#endif