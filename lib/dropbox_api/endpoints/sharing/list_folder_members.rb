module DropboxApi::Endpoints::Sharing
  class ListFolderMembers < DropboxApi::Endpoints::Rpc
    Method      = :post
    Path        = "/2/sharing/list_folder_members".freeze
    ResultType  = DropboxApi::Results::SharedFolderMembers
    ErrorType   = DropboxApi::Errors::SharedFolderAccessError

    include DropboxApi::Endpoints::OptionsValidator

    # @method list_folder_members(folder_id, actions, options)
    # Returns shared folder membership by its folder ID.
    #
    # Apps must have full Dropbox access to use this endpoint.
    #
    # @param folder_id [String] The ID for the shared folder.
    # @option limit [Numeric] The maximum number of results that include
    #   members, groups and invitees to return per request. The default for
    #   this field is 1000.
    # @return [SharedFolderMembers] Shared folder user and group membership.
    add_endpoint :list_folder_members do |folder_id, options = {}|
      # NOTE: This endpoint accepts an additional option `actions` which hasn't
      #       been implemented.
      validate_options([:limit], options)
      options[:limit] ||= 100

      perform_request options.merge({
        :shared_folder_id => folder_id
      })
    end
  end
end
