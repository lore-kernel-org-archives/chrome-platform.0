Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677D6538F
	for <chrome-platform@lists.linux.dev>; Wed,  6 Jul 2022 17:23:38 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id b2so14172943plx.7
        for <chrome-platform@lists.linux.dev>; Wed, 06 Jul 2022 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yav60sk4t1jSHI9y7JwNTzYMHxVBsDg0h4MxYyUTEPE=;
        b=j2Jn45au290gtTFCTf5ikH5yAqAHf0I7w5DZ6J2ln2fTcaKI1HD+BMjDKiRf1fWhsh
         XfiCuSZJyaHD/8ghRqM5EcDDKHtC+IzPaP0SpwDeXP4r9gVE5NuBWd/QOd2qKPIqblc9
         h/DGkYqxjMj00Jr6530xkwT3Gme6bs4dSOdfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yav60sk4t1jSHI9y7JwNTzYMHxVBsDg0h4MxYyUTEPE=;
        b=qV1DzInzmvDCc4aGMrVFMK14tcWjbvpjnBtexsKEgRgrUOn9ZH7S2l4+JU+NOb2hR5
         jfqAmXZFY+ZpSrSanpyZQSyj4TY75rc125AtHsEDt7gUtBhhZAK2mOubZq590CNvY+bR
         7ufPRvCfandNHBgGrRK+pZWh3TacNoAi+LYJKWWmdg/j6JwiNmWQTrE6Gy9WsHvxp+yi
         pqb1OQVl+X6CkZRNqVaJiCz/otStfZizn+ryxiJbXJELpTl2YxvfPe26mj28IMRSfIZW
         ihJVAyQ3HLjfSoF1Mv7ukTJuxP7BPZzXeBNmwj3KtKD+bk94E5muyL94DgoWvybxHr/7
         T2Dg==
X-Gm-Message-State: AJIora8tHH2rjb4L4OeQTFd8XPFZz+VWtCxqeSqcG0E7nDWj7PwMhPRN
	3JL2MzN7WcaNG3l1fcQnLQ2LSA==
X-Google-Smtp-Source: AGRyM1tnnh3jgtm7cCp9Qgeg1uF8C64jY6TXiUAsXTO+1wpBfTZrDmt44SkdsuY2bjLKYP5D1k01mw==
X-Received: by 2002:a17:902:d50b:b0:16c:474:ce67 with SMTP id b11-20020a170902d50b00b0016c0474ce67mr3487691plg.112.1657128217975;
        Wed, 06 Jul 2022 10:23:37 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f7ce00b0016be0d5483asm7514953plw.252.2022.07.06.10.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:23:37 -0700 (PDT)
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
Subject: [PATCH v2 8/9] platform/chrome: cros_ec_typec: Cleanup switch handle return paths
Date: Wed,  6 Jul 2022 17:15:12 +0000
Message-Id: <20220706171601.807042-9-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220706171601.807042-1-pmalani@chromium.org>
References: <20220706171601.807042-1-pmalani@chromium.org>
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

