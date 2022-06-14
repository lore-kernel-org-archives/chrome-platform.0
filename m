Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6571FA3
	for <chrome-platform@lists.linux.dev>; Tue, 14 Jun 2022 07:57:39 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id l4so6754675pgh.13
        for <chrome-platform@lists.linux.dev>; Tue, 14 Jun 2022 00:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=im11BmF4AkSvI7LJUG+0S/RpqxIynxFnf8uu1Qq4PqM=;
        b=GJ8dYa+L62FlKJzQknArn9TueEREN6ETCdbHZQ9MPWYSnjRDuAGF6amAEBpjMkLsiL
         SsX1neP70H5zQSNi5Q5KayZ4BmEa8GWvbm7a0EvJWWO4NdXQQsN7JY1CFC+jkV/8zgpB
         k2chA8jmFIjuhwVCj9KhshwL+swUA5ZAWYWVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=im11BmF4AkSvI7LJUG+0S/RpqxIynxFnf8uu1Qq4PqM=;
        b=04A3dW4fMPZ5kRA1VozDtvfs2Bsx2qGi/SBBfnNgnXrszB2rRjVVDxxnpdvlDPfCnl
         3TaRL+ajyVe+1aHx+Fx7g/bQKdktuqbS2UufvAVxf5Yc/PDuN1kTAV3Qi5nXKz1N9bIr
         nfp4Ulc1Px+ebowZP4HpzGvOzNsAH3TTXuA73QwLJpgNdydAiFRfA+QyK50sYZiFUIgt
         k6Hf0hlBjdN8kUhw3E6rkYLxLN/snwho3iWuJH9lUzWkLqb4ueQKwy4ZLr6sHRrlEjxU
         2xbxDbUboJTk1OUHz9M4Q9eETjoD4jJ1P2MA9drsYHCnA5kC/L1zO6t61+3dlfkw93IU
         YdmA==
X-Gm-Message-State: AOAM531AIM6nMapxZrVXNZuenn8yVTls9zgtcXJjRB/RQigko5CCwSAF
	4d+gbBKWE9QnNkcuarEoEWu/2AZZ+NYE5w==
X-Google-Smtp-Source: ABdhPJx4qyRJRg61YqX8d1DAvEWFptjZwj/AzMDAj3ZLksoBXcfc7inBeQBia7yv748SSeIjyJXg2Q==
X-Received: by 2002:a63:e946:0:b0:401:b982:38a7 with SMTP id q6-20020a63e946000000b00401b98238a7mr3405759pgj.327.1655193447932;
        Tue, 14 Jun 2022 00:57:27 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:82ae:1136:b202:95da])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709028d8b00b00165105518f6sm6469759plo.287.2022.06.14.00.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 00:57:27 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Benson Leung <bleung@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Rajat Jain <rajatja@chromium.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Evan Green <evgreen@chromium.org>
Subject: [PATCH v3] platform/chrome: cros_ec: Always expose last resume result
Date: Tue, 14 Jun 2022 00:57:26 -0700
Message-Id: <20220614075726.2729987-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last resume result exposing logic in cros_ec_sleep_event()
incorrectly requires S0ix support, which doesn't work on ARM based
systems where S0ix doesn't exist. That's because cros_ec_sleep_event()
only reports the last resume result when the EC indicates the last sleep
event was an S0ix resume. On ARM systems, the last sleep event is always
S3 resume, but the EC can still detect sleep hang events in case some
other part of the AP is blocking sleep.

Always expose the last resume result if the EC supports it so that this
works on all devices regardless of S0ix support. This fixes sleep hang
detection on ARM based chromebooks like Trogdor.

Cc: Rajat Jain <rajatja@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Guenter Roeck <groeck@chromium.org>
Reviewed-by: Evan Green <evgreen@chromium.org>
Fixes: 7235560ac77a ("platform/chrome: Add support for v1 of host sleep event")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes from v2 (https://lore.kernel.org/r/20220611061825.4119270-1-swboyd@chromium.org):
 * Change slp_s0 to sleep in warning message

Changes from v1 (https://lore.kernel.org/r/20220610223703.3387691-1-swboyd@chromium.org):
 * Fixed typo

 drivers/platform/chrome/cros_ec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index b3e94cdf7d1a..00381490dd3e 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -135,16 +135,16 @@ static int cros_ec_sleep_event(struct cros_ec_device *ec_dev, u8 sleep_event)
 	buf.msg.command = EC_CMD_HOST_SLEEP_EVENT;
 
 	ret = cros_ec_cmd_xfer_status(ec_dev, &buf.msg);
-
-	/* For now, report failure to transition to S0ix with a warning. */
+	/* Report failure to transition to system wide suspend with a warning. */
 	if (ret >= 0 && ec_dev->host_sleep_v1 &&
-	    (sleep_event == HOST_SLEEP_EVENT_S0IX_RESUME)) {
+	    (sleep_event == HOST_SLEEP_EVENT_S0IX_RESUME ||
+	     sleep_event == HOST_SLEEP_EVENT_S3_RESUME)) {
 		ec_dev->last_resume_result =
 			buf.u.resp1.resume_response.sleep_transitions;
 
 		WARN_ONCE(buf.u.resp1.resume_response.sleep_transitions &
 			  EC_HOST_RESUME_SLEEP_TIMEOUT,
-			  "EC detected sleep transition timeout. Total slp_s0 transitions: %d",
+			  "EC detected sleep transition timeout. Total sleep transitions: %d",
 			  buf.u.resp1.resume_response.sleep_transitions &
 			  EC_HOST_RESUME_SLEEP_TRANSITIONS_MASK);
 	}

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
https://chromeos.dev

