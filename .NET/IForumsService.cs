public interface IForumsService 
    {
        List<ForumMain> SelectAllForumByCategory();
        int CreateForum(ForumAddRequest model);
        void DeleteForum(int id);
        Paged<Forum> GetAllForums(int pageIndex, int pageSize);
        Forum GetForumById(int id);
        void UpdateForum(ForumUpdateRequest model);
        Paged<Forum> GetForumsBySearchPagination(string query, int pageIndex, int pageSize);
        Paged<Forum> GetForumsByCategoryPaginated(int categoryId, int pageIndex, int pageSize);
        Paged<Thread> GetThreadsByCreatedBy(int createdBy, int pageSize, int pageIndex);
        List<Thread> GetThreadsByForumId(int forumId);
        Paged<Thread> GetThreadsByParentId(int parentId, int pageSize, int pageIndex);
        int CreateThread(ThreadAddRequest model);
        void DeleteThread(int id);
        void UpdateThread(ThreadUpdateRequest model);
        List<Thread> GetNestedThreads(List<Thread> threads);
    }
