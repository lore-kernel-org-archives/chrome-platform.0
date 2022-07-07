Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C294E2F2B
	for <chrome-platform@lists.linux.dev>; Thu,  7 Jul 2022 22:27:10 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id bh13so14895009pgb.4
        for <chrome-platform@lists.linux.dev>; Thu, 07 Jul 2022 15:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HWZjQkLUf6qk+G+fYBQqj9gsWBV3+/ITHeFpM/SM9wo=;
        b=ixoq2AkyRxuboKSJKZx8muAfii9lRyEyzUS7IFt5M7B/IMVJjo9CY9WhHpxlS674W3
         3z+yGgk1ivWbkvzY1w7ar5/W0LICNY6nxFr+x1karg5PUrxrZL18qEI43CHgT4aIhLU4
         LIrSEeiIrXEMfbdNzDD6tuaXHUxvyiznfkyZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HWZjQkLUf6qk+G+fYBQqj9gsWBV3+/ITHeFpM/SM9wo=;
        b=bCXHFD7jX2TorxPyB2GsHzlBhWx2vRpONU1cCl+tey/hpeAOV6Jm/0BY+wmbBIf0B1
         gQvyaePg2/NMHQiMVTdqnU/WtmwuuORJ5NeRzX4VdFkqY6wPrm3sJCIZUgk+lpdffw6w
         PIZauH6E5fgRfnZETrz7N9AtrOIwc972alGgTWrJtR1SVFuOT8roroIsmBHEOBzpaQND
         7mcUbV1iALLwi0U1/bL0rJqj1NEquxqAO4pZcUGWgJAPZaw/RNHaLkv/4M7ZzSTZWurI
         Yjsy5525A336Uyzvn6DtpdOtkeF1dp8KedCKJUe0ovnEQiRhMnJ8HjAyLleCCboMKQWx
         3eYg==
X-Gm-Message-State: AJIora8rlK2r7a5olXaIw2esjYxX+w1MYrh+58DQH0b1ofdGT8++e5Lz
	GIQUARs04JCCeImSlLvC4RpKuQ==
X-Google-Smtp-Source: AGRyM1vw7KYRt0Y5e064i6OXHvQrKKt7U3rCYM4QH9TVNn7L62a4a+W9UcU9HuwSNJmdWTrWyRlCSQ==
X-Received: by 2002:a65:5b44:0:b0:412:b6dc:7076 with SMTP id y4-20020a655b44000000b00412b6dc7076mr270918pgr.601.1657232830357;
        Thu, 07 Jul 2022 15:27:10 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id 66-20020a620445000000b005289bfcee91sm5545657pfe.59.2022.07.07.15.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:27:10 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	heikki.krogerus@linux.intel.com,
	Prashant Malani <pmalani@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v3 8/9] platform/chrome: cros_ec_typec: Cleanup switch handle return paths
Date: Thu,  7 Jul 2022 22:20:15 +0000
Message-Id: <20220707222045.1415417-9-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220707222045.1415417-1-pmalani@chromium.org>
References: <20220707222045.1415417-1-pmalani@chromium.org>
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

Changes since v2:
- No changes.

Changes since v1:
- No changes.

 drivers/platform/chrome/cros_ec_typec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7cb2e35c4ded..39e6fd4491a9 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -157,12 +157,10 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
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
2.37.0.rc0.161.g10f37bed90-goog

