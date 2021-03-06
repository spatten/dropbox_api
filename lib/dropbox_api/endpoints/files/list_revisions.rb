module DropboxApi::Endpoints::Files
  class ListRevisions < DropboxApi::Endpoints::Rpc
    Method      = :post
    Path        = "/2/files/list_revisions".freeze
    ResultType  = DropboxApi::Results::ListRevisionsResult
    ErrorType   = DropboxApi::Errors::ListRevisionsError

    include DropboxApi::Endpoints::OptionsValidator

    # @method list_revisions(path, options = {})
    # Return revisions of a file
    #
    # @param path [String] The path to file you want to see the revisions of.
    # @option limit [Numeric] The maximum number of revision entries returned.
    #   The default for this field is 10.
    add_endpoint :list_revisions do |path, options = {}|
      validate_options([
        :limit
      ], options)
      options[:limit] ||= 10

      perform_request options.merge({
        :path => path
      })
    end
  end
end
