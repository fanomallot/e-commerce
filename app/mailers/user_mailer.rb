class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def command_email(id)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
   @o = Order.find(id)
   current_user = @o.user 
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @o.user.email, subject: 'Bienvenue chez nous !') 
  end
end