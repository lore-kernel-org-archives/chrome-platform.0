Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E50723A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E486AC433EF;
	Mon, 13 Mar 2023 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700688;
	bh=FwSPRVesW2Gyt1ri6YvL40cclXRv6ZLqiQO8yAUou+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uau468kY8nhyxGeQobAgRWlF/QUkIOJF/SWg+5xhq+bJaiNOP/KTLbrq0uMp3tY4+
	 yJC6DS6QHfCmzZ9T2Ll4ReyPwNiCw/oeeRvPs8Fk4kq2t6/wI0khdWu42CgtOjmbCA
	 ZwHlaSpIV2u+iO1xC9J8LOM0NPJjxtmW6ct6VigOKuTH7efKyeIWxfHOYx3EZamoow
	 HETj43O4cLSmdqA5185dMCy293u78jbb7XxDIUVOREDkQcCiLr93/h3WndLXJz8pfH
	 ZjqedzTWWeE2plBjNjjHlkfDY20acnn94FlUfwzQeivbN4vyKJQVYPUZnzihoGXL7A
	 h9fWAl6ixHnhQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 06/14] helpers/mcu: fix ResourceWarning on /dev/cros_ec
Date: Mon, 13 Mar 2023 17:44:23 +0800
Message-Id: <20230313094431.507952-7-tzungbi@kernel.org>
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

Fix the following warning:
> ResourceWarning: unclosed file <_io.TextIOWrapper name='/dev/cros_ec'

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/helpers/mcu.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/cros/helpers/mcu.py b/cros/helpers/mcu.py
index e1f09f39af89..80e3328cdf08 100644
--- a/cros/helpers/mcu.py
+++ b/cros/helpers/mcu.py
@@ -112,8 +112,6 @@ def is_feature_supported(feature):
     global ECFEATURES
 
     if ECFEATURES == -1:
-        fd = open("/dev/cros_ec", "r")
-
         param = ec_params_get_features()
         response = ec_response_get_features()
 
@@ -124,11 +122,10 @@ def is_feature_supported(feature):
         cmd.outsize = sizeof(response)
 
         memmove(addressof(cmd.data), addressof(param), cmd.outsize)
-        fcntl.ioctl(fd, EC_DEV_IOCXCMD, cmd)
+        with open("/dev/cros_ec", "r") as fh:
+            fcntl.ioctl(fh, EC_DEV_IOCXCMD, cmd)
         memmove(addressof(response), addressof(cmd.data), cmd.outsize)
 
-        fd.close()
-
         if cmd.result == 0:
             ECFEATURES = response.out_data
         else:
-- 
2.40.0.rc1.284.g88254d51c5-goog

