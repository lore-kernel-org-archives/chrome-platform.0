Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CD12C80
	for <chrome-platform@lists.linux.dev>; Mon,  7 Feb 2022 21:41:42 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id om7so1050854pjb.5
        for <chrome-platform@lists.linux.dev>; Mon, 07 Feb 2022 13:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s/hl0O9rqFd7bKBt/Qe/w/3MyowDWns3Oab/XTzbE6A=;
        b=OWIX7hGJb7sr/BycqGl/565lOe5WzmuzxWaEf+NxhZTIsTw/cUwFyXL5+5oz6CBGbc
         aX95wrOMhy++t4NUbmWC4EkVBiqP3BebTj5kmifMoxuwB9x+WJIwDNpf6SGPrxAmOWO/
         JQDwMJWZJbyXLgQJCdl62alITB9Ft0WuWh2LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s/hl0O9rqFd7bKBt/Qe/w/3MyowDWns3Oab/XTzbE6A=;
        b=Jqs2EyxpLIYxjHWbYWEqNjOvs0hczp/BAvtBci9T5/Iva1kB5H9BFipoYic+3SdT7Z
         6ZIYVMhTYD1mwD9c3HrKdVUDZO9zL641PN4pf6c6B3IgCKZNpHvauQsOVTVkzUgqHpfm
         oB8qxjhpGebAKdqL27LQr6HslagveUybJU2x5ei/0LUGMWFbrNYaLit1XFjie9lt+yow
         Pgy4SzJ9UmdkCnBLVC6kfXo/OeXihb0u2UkNhYfKRwF0KE8Die7RBNVbtAROCjZmZlt4
         zmtvkRJ9Onf3Yes3o99qBket1RTqxNpUCgGDj6r8dXT5egOvQX+j+LQjyUnINxjIN9pk
         bd9g==
X-Gm-Message-State: AOAM5331KhMm9ZvtcGp7UrcncyBJsDdDic9lsIBg9a4wMsesClXFigOV
	gUmm5PkGhRKRZxwssqB+IPuHVFYscubenA==
X-Google-Smtp-Source: ABdhPJyeEBlPmpFICFq2NN4b0ydlmQv/nNFJsYMLBjte8XvejLtZ8GQK+u74wDQefVudR8Zv6j1KGw==
X-Received: by 2002:a17:902:8f8e:: with SMTP id z14mr1601969plo.28.1644270101643;
        Mon, 07 Feb 2022 13:41:41 -0800 (PST)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id s9sm9268010pgm.76.2022.02.07.13.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 13:41:41 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROMEOS EC USB TYPE-C DRIVER)
Subject: [PATCH 4/4] platform/chrome: cros_ec_typec: Update mux flags during partner removal
Date: Mon,  7 Feb 2022 21:40:30 +0000
Message-Id: <20220207214026.1526151-5-pmalani@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220207214026.1526151-1-pmalani@chromium.org>
References: <20220207214026.1526151-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cros_typec_remove_partner(), we call
cros_typec_usb_disconnect_state() which sets the switches/muxes to be in
a disconnected state. This also happens in cros_typec_configure_mux().
However, unlike there, here the mux_flags variable hasn't been updated
to reflect that a disconnection has occurred. Update the flag here
accordingly.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 164c82f537dd..ce37b6abe69f 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -228,6 +228,7 @@ static void cros_typec_remove_partner(struct cros_typec_data *typec,
 	cros_typec_unregister_altmodes(typec, port_num, true);
 
 	cros_typec_usb_disconnect_state(port);
+	port->mux_flags = USB_PD_MUX_NONE;
 
 	typec_unregister_partner(port->partner);
 	port->partner = NULL;
-- 
2.35.0.263.gb82422642f-goog

