Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4608C23A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EECC433A0;
	Mon, 13 Mar 2023 09:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700694;
	bh=rnjXBeAcXxDUUsM8/mE+PueXwxV4Ifw9ZDIEQ8qjclQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=topM+HHO5q4Y/f5vdk7/Hua1YcHPrErGQOcOvSQXJ9zVTvQFXGmbJPZ3RG31fQADA
	 ruk31aJeM5M8H1XTKzKSD4uRrlFTrwwh5+jknN20AQlwxNng6jTW6Ok8E+UR4B6COE
	 PGV/9f+nDDc0oQn8cVvEDihtH3DACN9vnA6L0AIFbokLG+Xapes2BThvI/vmowBD1P
	 kfaRmuFQSirQ6lFGGe1p1HwjQQaIHkzPQFjzkGMRwRHO0HiDB5XLwrrSPqBlqt22Uw
	 ggZbasGTazUGlb+IRZueASC1zv1pfmG13p9n+RQTb9TK7/gz4FNVPLY/l0PDj5ZRSI
	 IqesBXYBPEkrA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 10/14] helpers/mcu: fix packet too long error
Date: Mon, 13 Mar 2023 17:44:27 +0800
Message-Id: <20230313094431.507952-11-tzungbi@kernel.org>
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

sizeof(c_ulong) is 4 in some platforms.  However, EC_CMD_GET_FEATURES
returns 2 uint32[1].

Fix the following error from test execution:
> Traceback (most recent call last):
>   File "...cros/tests/cros_ec_rtc.py", line 12, in test_cros_ec_rtc_abi
>     if not is_feature_supported(EC_FEATURE_RTC):
>   File "...cros/helpers/mcu.py", line 126, in is_feature_supported
>     fcntl.ioctl(fh, EC_DEV_IOCXCMD, cmd)
> OSError: [Errno 90] Message too long

And the following error message from dmesg:
> cros-ec-spi spi2.0: packet too long (8 bytes, expected 4)

Use c_uint64 to explicitly specify the data size.

[1]: https://crrev.com/6bf531fc1c115b24e2148fc4e040081ef354cdf6/include/ec_commands.h#1594

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/helpers/mcu.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cros/helpers/mcu.py b/cros/helpers/mcu.py
index 27ce9ad5cc58..506730e71115 100644
--- a/cros/helpers/mcu.py
+++ b/cros/helpers/mcu.py
@@ -90,11 +90,11 @@ class ec_response_get_version(Structure):
     ]
 
 class ec_params_get_features(Structure):
-    _fields_ = [("in_data", c_ulong)]
+    _fields_ = [("in_data", c_uint64)]
 
 
 class ec_response_get_features(Structure):
-    _fields_ = [("out_data", c_ulong)]
+    _fields_ = [("out_data", c_uint64)]
 
 
 def EC_FEATURE_MASK_0(event_code):
-- 
2.40.0.rc1.284.g88254d51c5-goog

