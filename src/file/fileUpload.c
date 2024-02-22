#include <stdio.h>
#include <unistd.h>
#include <serverAPI.h>
#include <serverCustomAPI.h>

char *APINAME = "/file/fileUpload";

int custom(taskTreePoolNode *ttpn, APINode *an, MYSQL *sqlConnection) {
    printf("!完成自动化!\n");

    char buf[1024];
    read(ttpn->n_clientFd, buf, 1024);
    printf("%s\n", buf);
    return 0;
}