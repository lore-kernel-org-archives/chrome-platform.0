Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B29F20F0
	for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 05:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9DCC433EF;
	Tue, 11 Apr 2023 05:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681191216;
	bh=tlrzEkaB0aL0i2kmj6XPGfsxhneOf84hGPGRITKnDDs=;
	h=From:To:Cc:Subject:Date:From;
	b=aUdE3Kyx4yrGQ0G63/m6VJSA7BmXvmUBr8wGHZYsFmz6NUZHYeQN3BgfkgsdGKDSR
	 rDShW68KrPGZmBAm1+rXgw2sm2I0bjseICmeqjeK2hSmwdCLfHbJ0AdBO9I8+lq/cH
	 8m4Cf0iZ47Ac8z78IuTLHNPTDCOi1D3mcNaXoXnNbdes+36Q77I7plvLlxJq+UYvov
	 nz2owv6+MrcFae7luXavcceuCpAWOFgQ8FAJFVhku2MM/POUHxBi1pvr7kIEcSek1F
	 k8CTvFwhG0XTZuQFymmPdayGqqfC8KtEOUV9Hz+9AxTqnQx/M6TVjnWKo2cSKDUhIJ
	 mPrvYTxJqXrfg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	robbarnes@google.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/chrome: cros_ec_debugfs: fix kernel-doc warning
Date: Tue, 11 Apr 2023 13:33:08 +0800
Message-Id: <20230411053308.1572493-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following kernel-doc warning:

$ ./scripts/kernel-doc -none drivers/platform/chrome/*
[...]
warning: This comment starts with '/**', but isn't a kernel-doc comment.

Fixes: 14bb09b32f43 ("platform/chrome: cros_ec: Separate logic for getting panic info")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
I should put it in my checklist in the future before pushing patches to
for-next.

 drivers/platform/chrome/cros_ec_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 414ebfffcf83..c876120e0ebc 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -400,7 +400,7 @@ static void cros_ec_cleanup_console_log(struct cros_ec_debugfs *debug_info)
 	}
 }
 
-/**
+/*
  * Returns the size of the panicinfo data fetched from the EC
  */
 static int cros_ec_get_panicinfo(struct cros_ec_device *ec_dev, uint8_t *data,
-- 
2.40.0.577.gac1e443424-goog

