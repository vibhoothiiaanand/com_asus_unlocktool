.class public Lcom/asus/unlock/device/ME175KG;
.super Lcom/asus/unlock/device/A66;

# interfaces
.implements Lcom/asus/unlock/aa;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/asus/unlock/device/A66;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method private static native getNativeID()Ljava/lang/String;
.end method

.method private static native getNativeKey()Ljava/lang/String;
.end method

.method private static native writeNativeSignAndReboot([BI)V
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    sget-object v0, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    return-object v0
.end method

.method public a(Ljava/lang/String;)V
    .locals 3

    invoke-static {p1}, Lcom/asus/unlock/device/ME372CG;->a(Ljava/lang/String;)[B

    move-result-object v0

    array-length v1, v0

    invoke-static {v0, v1}, Lcom/asus/unlock/device/ME372CG;->writeNativeSignAndReboot([BI)V

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x3

    if-ge v0, v1, :cond_0

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    const-string v2, "/system/bin/sync"

    invoke-virtual {v1, v2}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void

    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method public getID()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/asus/unlock/device/ME372CG;->getNativeID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/asus/unlock/device/ME372CG;->getNativeKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public reboot()V
    .locals 2

    iget-object v0, p0, Lcom/asus/unlock/device/ME372CG;->mContext:Landroid/content/Context;

    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const-string v1, "oem-08"

    invoke-virtual {v0, v1}, Landroid/os/PowerManager;->reboot(Ljava/lang/String;)V

    return-void
.end method
