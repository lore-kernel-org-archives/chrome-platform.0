Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00F54A09
	for <chrome-platform@lists.linux.dev>; Fri, 19 Aug 2022 19:08:28 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id y15so1126873pfr.9
        for <chrome-platform@lists.linux.dev>; Fri, 19 Aug 2022 12:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=NY3og6uVOGIRfydWAoiK8DTzipQrxXXqtzrWPkrx8rE=;
        b=VJQxFgKABXidqeK6PcYka/SLJnrMhsN5piLG5aBGrmKOX55QepEObQ88MWMkZXJH0H
         MiYLtWEBXs8MGcNVMdwZMFOJBshSIXYwtMBZzDrFt9ptpY6CdufVoVXJu16TZ0tajZkv
         YxXPq9YarjoNbmyvcRjmrlu7hctfeeWFP38yY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=NY3og6uVOGIRfydWAoiK8DTzipQrxXXqtzrWPkrx8rE=;
        b=qIc/9we2ftKa6yMeJpLD5nQygRRyuVby4DadQ5eQu0Zegi9+9yGv2nZOhr1Rb34zxf
         9RYp8gHe6vrLyctBdFHkOS5et4q10F/m7yVd3ewZo4MW7RitoPbj843gB1N0orc3ujRi
         UIj+vscv+0WdBbhBbewYnK7HS1Xvh5NZWmBg0H/pcN0o++DINH9SdsoWb7DkBlrj+jGh
         hDG145qscz15Q6ThbAGfmdK6lO0akcRyFjJZqXLEuO1YguDP2cYnxH2sp0nwkiWnvAJ/
         iOlk0Pm/3MnfjEI0WmUK/mCRzCQO6JOhtwxXY6zYFR6TCUmVknAVxGomv2rsp+ZAP++E
         wJiA==
X-Gm-Message-State: ACgBeo1fKmweCD0V8r0LV/K4tu4xZIIZBIEMhZNlDCYfOYuz29YkEZmz
	5qlGSMNxTs5zd4w0x3o6IiUoAg==
X-Google-Smtp-Source: AA6agR4hHW67M1U75F44AWEu1mn0JI3XHNB4+7SKR0ssNvQHD9p15ZaaWOD10jBLMG5e8LtgM67xsg==
X-Received: by 2002:a63:6b02:0:b0:422:7cf8:4bf with SMTP id g2-20020a636b02000000b004227cf804bfmr7501437pgc.92.1660936108315;
        Fri, 19 Aug 2022 12:08:28 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id b14-20020a170903228e00b00172a567d910sm3499775plh.289.2022.08.19.12.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 12:08:28 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 2/4] platform/chrome: cros_ec_typec: Correct alt mode index
Date: Fri, 19 Aug 2022 19:08:03 +0000
Message-Id: <20220819190807.1275937-3-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
In-Reply-To: <20220819190807.1275937-1-pmalani@chromium.org>
References: <20220819190807.1275937-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alt mode indices used by USB PD (Power Delivery) start with 1, not 0.

Update the alt mdoe registration code to factor this in to the alt mode
descriptor.

Fixes: de0f49487db3 ("platform/chrome: cros_ec_typec: Register partner altmodes")
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 4d81d8d45b73..dc5722db2066 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -698,7 +698,7 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 		for (j = 0; j < sop_disc->svids[i].mode_count; j++) {
 			memset(&desc, 0, sizeof(desc));
 			desc.svid = sop_disc->svids[i].svid;
-			desc.mode = j;
+			desc.mode = j + 1;
 			desc.vdo = sop_disc->svids[i].mode_vdo[j];
 
 			if (is_partner)
-- 
2.37.1.595.g718a3a8f04-goog

