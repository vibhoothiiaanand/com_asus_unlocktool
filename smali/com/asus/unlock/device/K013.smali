.class public Lcom/asus/unlock/device/K013;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/asus/unlock/aa;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/asus/unlock/device/K013;->mContext:Landroid/content/Context;

    const/16 v0, 0x17

    sput v0, Lcom/asus/unlock/d;->c:I

    return-void
.end method

.method public static a(Ljava/lang/String;)[B
    .locals 2

    new-instance v0, Ljava/math/BigInteger;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    return-object v0
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

    invoke-static {p1}, Lcom/asus/unlock/device/K013;->a(Ljava/lang/String;)[B

    move-result-object v0

    array-length v1, v0

    invoke-static {v0, v1}, Lcom/asus/unlock/device/K013;->writeNativeSignAndReboot([BI)V

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

    invoke-static {}, Lcom/asus/unlock/device/K013;->getNativeID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/asus/unlock/device/K013;->getNativeKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOrientation()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public reboot()V
    .locals 2

    iget-object v0, p0, Lcom/asus/unlock/device/K013;->mContext:Landroid/content/Context;

    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const-string v1, "bootloader"

    invoke-virtual {v0, v1}, Landroid/os/PowerManager;->reboot(Ljava/lang/String;)V

    return-void
.end method
