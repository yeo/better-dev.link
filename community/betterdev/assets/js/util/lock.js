import Auth0Lock from 'auth0-lock'
import session from '../session'

const lock = window.lock = new Auth0Lock('a-wb-XWRmIfAm9v0U9eUbfawoJKsGG99', 'yeo.auth0.com', {
	auth: {
		redirect: false,
		//redirectUrl: 'http://127.0.0.1:4000',
		//responseType: 'token',
		responseType: 'id_token',
		params: {
			scope: 'openid email'
		}
	}
})

lock.on("authenticated", (authResult) => {
  localStorage.setItem('accessToken', authResult.idToken)
  session.load(authResult.idToken)
  session.flash({message: "Login succesfully", type: 'success'})
})

export { lock as default }