.class public Lcom/euler/andfix/MainActivity_CF;
.super Landroid/app/Activity;
.source "MainActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "euler"


# instance fields
.field private myTestInt:I

.field private testLong:J


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation runtime Lcom/alipay/euler/andfix/annotation/MethodReplace;
        method = "<init>"
        clazz = "com.euler.andfix.MainActivity"
    .end annotation

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 34
    const/4 v0, 0x2

    iput v0, p0, Lcom/euler/andfix/MainActivity_CF;->myTestInt:I

    .line 35
    const-wide/16 v0, 0x2711

    iput-wide v0, p0, Lcom/euler/andfix/MainActivity_CF;->testLong:J

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation runtime Lcom/alipay/euler/andfix/annotation/MethodReplace;
        method = "onCreate"
        clazz = "com.euler.andfix.MainActivity"
    .end annotation

    .prologue
    .line 39
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 40
    const-string v0, "euler"

    const-string v1, "good"

    invoke-static {v1}, Lcom/euler/test/A;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    const-string v0, "euler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Lcom/euler/test/A;

    invoke-direct {v2}, Lcom/euler/test/A;-><init>()V

    const-string v3, "s1"

    const-string v4, "s2"

    invoke-virtual {v2, v3, v4}, Lcom/euler/test/A;->b(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    const-string v0, "euler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Lcom/euler/test/A;

    invoke-direct {v2}, Lcom/euler/test/A;-><init>()V

    invoke-virtual {v2}, Lcom/euler/test/A;->getI()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    const-string v0, "euler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "myTestInt = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/euler/andfix/MainActivity_CF;->myTestInt:I

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    iget-wide v0, p0, Lcom/euler/andfix/MainActivity_CF;->testLong:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lcom/euler/andfix/MainActivity_CF;->testLong(J)V

    .line 45
    const-string v1, "2"

    const-string v2, "s"

    const-string v3, "s"

    const-string v4, "s"

    const-string v5, "s"

    const-string v6, "s"

    const-string v7, "s"

    const-string v8, "s"

    const-string v9, "s"

    move-object v0, p0

    invoke-virtual/range {v0 .. v9}, Lcom/euler/andfix/MainActivity_CF;->testManyVar(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 58
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 59
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 60
    return-void
.end method

.method public testLong(J)V
    .locals 3
    .param p1, "tempLong"    # J
    .annotation runtime Lcom/alipay/euler/andfix/annotation/MethodReplace;
        method = "testLong"
        clazz = "com.euler.andfix.MainActivity"
    .end annotation

    .prologue
    .line 49
    const-string v0, "euler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "testLong = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    return-void
.end method

.method public testManyVar(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "ab"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/String;
    .param p3, "c"    # Ljava/lang/String;
    .param p4, "b"    # Ljava/lang/String;
    .param p5, "ed"    # Ljava/lang/String;
    .param p6, "l"    # Ljava/lang/String;
    .param p7, "string"    # Ljava/lang/String;
    .param p8, "v"    # Ljava/lang/String;
    .param p9, "o"    # Ljava/lang/String;
    .annotation runtime Lcom/alipay/euler/andfix/annotation/MethodReplace;
        method = "testManyVar"
        clazz = "com.euler.andfix.MainActivity"
    .end annotation

    .prologue
    .line 53
    const-string v0, "euler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "testManayVar = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    return-void
.end method
