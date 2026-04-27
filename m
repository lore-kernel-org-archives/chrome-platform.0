Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF793CFF6C;
	Mon, 27 Apr 2026 13:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297662; cv=none; b=iP0Sn4Bz+gqtoYQszumiiSB+4zGvPmzmj6ox6p5Wiuxbb3ZeaQ1jmTwznvIrjSrpCTlxOLi6VQ9N0fh+S0hpbMH2hheWGXYASXriep+60BL57Vqgtumh5TWhXTKfxzAybdK7gB3bOcA6396xjS8gVNO8UYaT66+YbYwFKYiNGew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297662; c=relaxed/simple;
	bh=0BW7jfUeG88uxvNr1klqn1DDv2c8qcfaHXFDvi6YT2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQvC72uvUuwdmZbZW8DSXhxwSg0kJaR72dFELomZMJ3OAmAeFOwGOvFYNSoxpwUPxHcFvpU5VATQ2SPYmVgNU7Z5zR6ECWhMgZwNmrhTa1yQBw2uMuWCyVSV1RCHZCnnkymCN5Tcxt/F5whaZxoBXME3Q0oN7glLpnbftLK+i3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfHwGx62; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfHwGx62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F2AC19425;
	Mon, 27 Apr 2026 13:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777297660;
	bh=0BW7jfUeG88uxvNr1klqn1DDv2c8qcfaHXFDvi6YT2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CfHwGx62/68RkUJXPK8KIFSMhPO7mljr/LfBkBU9uxQS31APzaZTi5xoOreWVV1Jk
	 prBK9N+VyYpuRG2xo4KTW6uryEoyDSxGSyroylEN2dm4tHx93A4yM41ABfGnplRT0B
	 2urqVLMYO7Bdp1a7qGPOcD1xwluoJtG9wUXTHO1Dl0BosDTyf1eQRAJfM6MnQQY6ni
	 yy5OI/r8dGHHfzx9IRnOarsw++jmKzzQVrAWH+L8JZ8cw9kpCcyRnvFgABocrJjBmR
	 UgZEcr0XZ6TAEFksaWIWV9pSykHpL5jnA50DilEcx0FoBM+Jjx05CzGxEoW4zbj7q7
	 lDEi3t29zRPiQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benson Leung <bleung@chromium.org>,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 2/8] char: misc: Introduce misc_find() helper
Date: Mon, 27 Apr 2026 21:46:53 +0800
Message-ID: <20260427134659.95181-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427134659.95181-1-tzungbi@kernel.org>
References: <20260427134659.95181-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce misc_find() to search for a miscdevice by minor number in
`misc_list`.  This helper requires `misc_mtx` to be held.

Use the new helper to reduce code duplication.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/char/misc.c | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index e2bea4f01851..c26315577d65 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -116,22 +116,32 @@ static const struct seq_operations misc_seq_ops = {
 };
 #endif
 
+static struct miscdevice *misc_find(int minor)
+{
+	struct miscdevice *iter;
+
+	lockdep_assert_held(&misc_mtx);
+
+	list_for_each_entry(iter, &misc_list, list) {
+		if (iter->minor == minor)
+			return iter;
+	}
+
+	return NULL;
+}
+
 static int misc_open(struct inode *inode, struct file *file)
 {
 	int minor = iminor(inode);
-	struct miscdevice *c = NULL, *iter;
+	struct miscdevice *c = NULL;
 	int err = -ENODEV;
 	const struct file_operations *new_fops = NULL;
 
 	mutex_lock(&misc_mtx);
 
-	list_for_each_entry(iter, &misc_list, list) {
-		if (iter->minor != minor)
-			continue;
-		c = iter;
-		new_fops = fops_get(iter->fops);
-		break;
-	}
+	c = misc_find(minor);
+	if (c)
+		new_fops = fops_get(c->fops);
 
 	/* Only request module for fixed minor code */
 	if (!new_fops && minor < MISC_DYNAMIC_MINOR) {
@@ -139,13 +149,9 @@ static int misc_open(struct inode *inode, struct file *file)
 		request_module("char-major-%d-%d", MISC_MAJOR, minor);
 		mutex_lock(&misc_mtx);
 
-		list_for_each_entry(iter, &misc_list, list) {
-			if (iter->minor != minor)
-				continue;
-			c = iter;
-			new_fops = fops_get(iter->fops);
-			break;
-		}
+		c = misc_find(minor);
+		if (c)
+			new_fops = fops_get(c->fops);
 	}
 
 	if (!new_fops)
@@ -229,13 +235,10 @@ int misc_register(struct miscdevice *misc)
 			return -EBUSY;
 		misc->minor = i;
 	} else {
-		struct miscdevice *c;
 		int i;
 
-		list_for_each_entry(c, &misc_list, list) {
-			if (c->minor == misc->minor)
-				return -EBUSY;
-		}
+		if (misc_find(misc->minor))
+			return -EBUSY;
 
 		i = misc_minor_alloc(misc->minor);
 		if (i < 0)
-- 
2.51.0

