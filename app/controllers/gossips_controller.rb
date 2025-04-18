class GossipsController < ApplicationController

    def index
      # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
      @gossip = Gossip.all
    end
  
    def show
      # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
      @gossip = Gossip.find(params[:id])
    end
  
    def new
      # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
      @gossip = Gossip.new
    end
  
    def create
      # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
      # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
      # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
      @gossip = Gossip.new(gossip_params)
        if @gossip.save
            redirect_to gossips_path, notice: 'Potin créé avec succès.'
        else
            render :new
        end
    end

    private

    def gossip_params
      params.require(:gossip).permit(:title, :author, :content)
    end
  
    def edit
      # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
      @gossip = Gossip.find(params[:id])
    end
  
    def update
      # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
      # pour info, le contenu de ce formulaire sera accessible dans le hash params
      # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
      @gossip = Gossip.find(params[:id])  # Trouve le potin en fonction de l'id

      if @gossip.update(gossip_params)
        # Si la mise à jour réussit, redirige vers le potin modifié
        redirect_to @gossip, notice: 'Potin mis à jour avec succès.'
      else
        # Si la mise à jour échoue (validation), reste sur la page d'édition
        render :edit
      end
    end
  
    def destroy
      # Méthode qui récupère le potin concerné et le détruit en base
      @gossip = Gossip.find(params[:id])  # Récupère le potin par son id

      # Supprime le potin
      @gossip.destroy
  
      # Une fois la suppression effectuée, redirige vers la liste des potins (index)
      redirect_to gossips_path, notice: 'Potin supprimé avec succès.'
    end
  end