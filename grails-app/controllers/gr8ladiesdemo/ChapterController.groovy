package gr8ladiesdemo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChapterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Chapter.list(params), model:[chapterInstanceCount: Chapter.count()]
    }

    def show(Chapter chapterInstance) {
        respond chapterInstance
    }

    def create() {
        respond new Chapter(params)
    }

    @Transactional
    def save(Chapter chapterInstance) {
        if (chapterInstance == null) {
            notFound()
            return
        }

        if (chapterInstance.hasErrors()) {
            respond chapterInstance.errors, view:'create'
            return
        }

        chapterInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chapterInstance.label', default: 'Chapter'), chapterInstance.id])
                redirect chapterInstance
            }
            '*' { respond chapterInstance, [status: CREATED] }
        }
    }

    def edit(Chapter chapterInstance) {
        respond chapterInstance
    }

    @Transactional
    def update(Chapter chapterInstance) {
        if (chapterInstance == null) {
            notFound()
            return
        }

        if (chapterInstance.hasErrors()) {
            respond chapterInstance.errors, view:'edit'
            return
        }

        chapterInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Chapter.label', default: 'Chapter'), chapterInstance.id])
                redirect chapterInstance
            }
            '*'{ respond chapterInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Chapter chapterInstance) {

        if (chapterInstance == null) {
            notFound()
            return
        }

        chapterInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Chapter.label', default: 'Chapter'), chapterInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chapterInstance.label', default: 'Chapter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
