package interceptors


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(AuthCheckInterceptor)
class AuthCheckInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test authCheck interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"authCheck")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
