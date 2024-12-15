Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84152A47
	for <chrome-platform@lists.linux.dev>; Sun, 15 Dec 2024 14:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734274160; cv=none; b=WVexCaW/ODE7STBsuXGenhmXhtTzyO71vJgXUq1DdiY9PAObXuBtn1xG+13L9TCAZoBV/9ijjhIZLi9QLaAtKoTLTICY8MwqL48djwdVaK/Rivql3h8NcGBfrrJsxZ56u0sLEVn0tn26/FOe9IyMFxZgcUMq/YCDU5ZRMRZo6eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734274160; c=relaxed/simple;
	bh=BOpBAV2k4jTrjMyus8d4jUCKCV1/z/2Q5Zkgqy8lyX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pelqPTGa2iGsZbftW1mi3kkRgohr4zWlx+zvKWRGRtnCQGK8UmLdrpJLWL8imSA9oB3bl7okijnU/qD/BbsjIlN6F7rQj/OBCPHXboZKYjtMY9tMPtET2RLmB4LibtQ/GNAcCPr6hW6EAdsW3F9mgbZupUMKQQn58RbFRv+1ucE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=IqgtwNum; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="IqgtwNum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734274154;
	bh=BOpBAV2k4jTrjMyus8d4jUCKCV1/z/2Q5Zkgqy8lyX8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IqgtwNumuDG6hu6iAXyqGtVi4UezcQqgWPszbQmzZzDKAcuat9abCB2fLs20b+00d
	 gCFhlEYZd8QKP9JpG3lf/nk62dP5MtMfq615pcmH6M6NNrwZhQ4vrMsE96szUH9kEG
	 JxIDX9O5e2jJuhlPYUQs3jK4ik57vwmnlWXnX6/g=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 15 Dec 2024 15:49:09 +0100
Subject: [PATCH 1/4] firmware: google: cbmem: Constify 'struct
 bin_attribute'
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241215-sysfs-const-bin_attr-google-v1-1-e5c2808f5833@weissschuh.net>
References: <20241215-sysfs-const-bin_attr-google-v1-0-e5c2808f5833@weissschuh.net>
In-Reply-To: <20241215-sysfs-const-bin_attr-google-v1-0-e5c2808f5833@weissschuh.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734274153; l=2094;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=BOpBAV2k4jTrjMyus8d4jUCKCV1/z/2Q5Zkgqy8lyX8=;
 b=EH8oiUeEjnDvdJqmUlSU2D4BtirI9kbHItut16hk9OkQC5wyFv/tUL4QVNdQUMGm1biH89wKW
 wZib3mqc3sQC3VM+39+CUqy2w7aUp2au7494DIm8pMuFTBiUauxDKCK
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/firmware/google/cbmem.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/google/cbmem.c b/drivers/firmware/google/cbmem.c
index 66042160b361fe2a2d9599880a96d5de14b7128d..773d05078e0ae0763591a6d9cfa0d55ea5fff611 100644
--- a/drivers/firmware/google/cbmem.c
+++ b/drivers/firmware/google/cbmem.c
@@ -30,7 +30,7 @@ static struct cbmem_entry *to_cbmem_entry(struct kobject *kobj)
 }
 
 static ssize_t mem_read(struct file *filp, struct kobject *kobj,
-			struct bin_attribute *bin_attr, char *buf, loff_t pos,
+			const struct bin_attribute *bin_attr, char *buf, loff_t pos,
 			size_t count)
 {
 	struct cbmem_entry *entry = to_cbmem_entry(kobj);
@@ -40,7 +40,7 @@ static ssize_t mem_read(struct file *filp, struct kobject *kobj,
 }
 
 static ssize_t mem_write(struct file *filp, struct kobject *kobj,
-			 struct bin_attribute *bin_attr, char *buf, loff_t pos,
+			 const struct bin_attribute *bin_attr, char *buf, loff_t pos,
 			 size_t count)
 {
 	struct cbmem_entry *entry = to_cbmem_entry(kobj);
@@ -53,7 +53,7 @@ static ssize_t mem_write(struct file *filp, struct kobject *kobj,
 	memcpy(entry->mem_file_buf + pos, buf, count);
 	return count;
 }
-static BIN_ATTR_ADMIN_RW(mem, 0);
+static const BIN_ATTR_ADMIN_RW(mem, 0);
 
 static ssize_t address_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
@@ -79,14 +79,14 @@ static struct attribute *attrs[] = {
 	NULL,
 };
 
-static struct bin_attribute *bin_attrs[] = {
+static const struct bin_attribute *const bin_attrs[] = {
 	&bin_attr_mem,
 	NULL,
 };
 
 static const struct attribute_group cbmem_entry_group = {
 	.attrs = attrs,
-	.bin_attrs = bin_attrs,
+	.bin_attrs_new = bin_attrs,
 };
 
 static const struct attribute_group *dev_groups[] = {

-- 
2.47.1

