    public class LicenseUpdateRequest : LicenseAddRequest, IModelIdentifier
    {
        public int Id { get; set; }
        public DateTime? DateVerified { get; set; }
    }
