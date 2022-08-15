Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297541102
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 06:46:50 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id 130so5960770pfv.13
        for <chrome-platform@lists.linux.dev>; Sun, 14 Aug 2022 23:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1w/+dFs3qHXbDgwwcXAk7wk0nI9cjI/ETzQwM0WXM7M=;
        b=c+Ok3qnKqp9fTdGMCOumYQW8c7kdDIeshFpol5j9R1lh85E9ONXyN9Ks5tp5BKso1r
         IcapWSIm+VQmVbWWdGuvB7X358tWZR0/Ury571YiT43L1wQrv+nc6FZoT56hCNEDzK5u
         aXpwpLDf4f3WJL1E7tUbzy+wn6B0Mo1K1yabc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1w/+dFs3qHXbDgwwcXAk7wk0nI9cjI/ETzQwM0WXM7M=;
        b=RvYMwDJKYoAyKcVg1nmk1dMcmAg+8j8lCeqfK+IgME1SmCoRRbbyKoIUXMFl9QamM/
         Bcjs733zamW5vuUbC+OCMlRI9WhTFdpc2jtPbjQ0jpXTQnoeef4dxnKz/OXePo9QU/u5
         mD99O9fmjXOXNI782MWVk/caNmRBCRUiOzQxiNeiJVf1DLrsFYTmpCDW6Up6MkUP9U/j
         Qft8d10E9DoYZX7RJU2H90kJnoIYREQNU3v2xp2+SOwPUWPF4DmHG54Wn4H6HBrl1bGm
         jWTX+9JMzHsdIIqkvK6aUv8i8LPB4rVKG5GB99NH8MsNE8wdeO6hNwXba1B5/cF9fmwg
         xt4g==
X-Gm-Message-State: ACgBeo0JxN6yNDa2nQN6fgg4vSFneUoOPyP/yfFHrxt0Dy1C4YXVKYwE
	iH3gXBUuX8KvOYvWXifW646s2w==
X-Google-Smtp-Source: AA6agR5II5bdhSqLWarYZ2IWhos4bAF5oIBs5Mk8jg7lxj85GCJRpLEucneEznC0TaAzBMuusm1rWw==
X-Received: by 2002:a63:8a44:0:b0:41c:cd7b:eda0 with SMTP id y65-20020a638a44000000b0041ccd7beda0mr13088494pgd.117.1660546009677;
        Sun, 14 Aug 2022 23:46:49 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id 200-20020a6214d1000000b0052db82ad8b2sm5988233pfu.123.2022.08.14.23.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:46:49 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH v5 6/7] platform/chrome: cros_ec_typec: Cleanup switch handle return paths
Date: Mon, 15 Aug 2022 06:34:28 +0000
Message-Id: <20220815063555.1384505-7-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
In-Reply-To: <20220815063555.1384505-1-pmalani@chromium.org>
References: <20220815063555.1384505-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the return paths for the cros_typec_get_switch_handles()
aren't necessary. Clean up the return paths to only undo the handle
get's which succeeded.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v4:
- No changes.

Changes since v3:
- No changes.

Changes since v2:
- No changes.

Changes since v1:
- No changes.

 drivers/platform/chrome/cros_ec_typec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index de6ee0f926a6..ee54add992db 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -158,12 +158,10 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
 	return 0;
 
 role_sw_err:
-	usb_role_switch_put(port->role_sw);
-ori_sw_err:
 	typec_switch_put(port->ori_sw);
-mux_err:
+ori_sw_err:
 	typec_mux_put(port->mux);
-
+mux_err:
 	return -ENODEV;
 }
 
-- 
2.37.1.595.g718a3a8f04-goog

