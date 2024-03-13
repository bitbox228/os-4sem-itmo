#!/bin/bash

awk -F'[= ]' '
BEGIN {
	ppid = -1;
};
{
    if (ppid != $5) {
		if (ppid != -1) {
			printf("Average_Running_Children_of_ParentID=%d is %f\n", ppid, art_sum / art_count);
		}
		ppid = $5;
		art_sum = 0;
		art_count = 0;
	}
	art_sum += $8;
	art_count++;
	print $0
};
END {
	printf("Average_Running_Children_of_ParentID=%d is %f\n", ppid, art_sum / art_count);
}' res04 > res05


