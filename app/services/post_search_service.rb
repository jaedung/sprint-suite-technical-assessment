class PostSearchService
  def initialize(query)
    @list = query[:list]
    @social_media_type = query[:social_media_type].downcase
    @start_date = query[:start_date]
    @end_date = query[:end_date]
  end

  def run
    # @posts = Post
    #   .joins(list_member: :list)
    #   .where(lists: { name: @custom_list })
    #   .or(Post.joins(list_member: :list)
    #     .where(lists: { name: @table }))

    @posts = Post.joins(list_member: :list)

    # if @custom_list.present? || @table.present?
    #   @posts = @posts.where(lists: { name: [@custom_list, @table] })
    # end

    if @list.present?
      @posts = @posts.where(lists: { name: @list })
    end

    if @social_media_type.present?
      @posts = @posts.where(source: @social_media_type)
    end

    if @start_date.present?
      @posts = @posts.where('posted_at >= ?', @start_date.to_datetime.beginning_of_day)
    end

    if @end_date.present?
      @posts = @posts.where('posted_at <= ?', @end_date.to_datetime.end_of_day)
    end

    @posts
  end
end
