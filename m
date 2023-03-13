Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C1B23A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EF6C4339E;
	Mon, 13 Mar 2023 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700686;
	bh=WeptGaIkUuaHhJdA7twl4v56UfNwfXYyrUH0KK37HN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uMSTKMsBJRzHMad/hmy86KeQ54QbZ2KKHimeNGI2ldXHt4OxaOxrEDsy6VvDcOA/U
	 QGX2XL2dL1l2lf8fZlcpMTMTNaCQHiCAJgUOHr7fdJQk+bUEZ6ZWLjE1uOyz4C+i3G
	 jQTZxc/dfPK/Nqs5L/l/XCB5e1xHu5cZScdWKM6I8gff9k6fepg67eU+41vmRfsgX7
	 JlfxmxMdmEr5rYs26dNEEQNcmgqgQxv2guRqri2XfdF/OgRfs+zhKGRRtyb/6OAxzV
	 eo5Vs/YbdCl1+aevWco4q0IVfCZ8OuZdhcU75u+8t3Cw1zNn6QygI+g83cGIJ8K4IU
	 QviQgcV9CHnqw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 05/14] helpers/sysfs: fix NameError
Date: Mon, 13 Mar 2023 17:44:22 +0800
Message-Id: <20230313094431.507952-6-tzungbi@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230313094431.507952-1-tzungbi@kernel.org>
References: <20230313094431.507952-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some errors have been revealed after the runner is-a TextTestRunner.

Fix the following error:
> NameError: name 'self' is not defined

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/helpers/sysfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cros/helpers/sysfs.py b/cros/helpers/sysfs.py
index f3abfabced24..1ccc0cd2ba24 100755
--- a/cros/helpers/sysfs.py
+++ b/cros/helpers/sysfs.py
@@ -33,6 +33,6 @@ def sysfs_check_attributes_exists(s, path, name, files, check_devtype):
             for filename in files:
                 s.assertEqual(os.path.exists(path + "/" + devname + "/" + filename), 1)
     except IOError as e:
-            self.skipTest("Exception occured: {0}, skipping".format(e.strerror))
+            s.skipTest("Exception occured: {0}, skipping".format(e.strerror))
     if match == 0:
         s.skipTest("No " + name + " found, skipping")
-- 
2.40.0.rc1.284.g88254d51c5-goog

