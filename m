Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389632C9C
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 18:47:39 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id n32so20419252pfv.11
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 10:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w3J0QKkr84VrudaJ3bhOXmAFtwa7Bv5tWoh+lneUqWM=;
        b=CXeTCXrzzT3Ml1fOtNTfQXwkPNlG/WSDsQlqTW/zEywRyF7j0hBThR0OpQtEw29wF5
         THBzVhkjvzf2l/H5yqCg5ADcVm+vos7y8H4hYAEs2XS8GQg3Jz030Sp3iqyWbuQ1YXP8
         mt/25TAsI7zRzLsWfDb8xb5cSyI2oeNpM6NyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w3J0QKkr84VrudaJ3bhOXmAFtwa7Bv5tWoh+lneUqWM=;
        b=L9rys3yMdmkz5arp9tRCC+D892Bg7RHXCXbCxkWsjYRjkBnhrEBGEKaaF+VpEfnz5K
         noZ9vKPYddmw3wB7YVBjSQxl+9NN8cfpaAHzA4Y8FLZNIja7UVfsUrOfk5TygTjOF6U5
         LqL5Fw8PZWdK+psyZYnY+DXynR1vMmS2p4SCOGK5Xtz0IsQYNy/Sdt6AJz7OX/EUBOyp
         2WWnXGK82ZtcVTZo97nfskGaUjhgBVDOJN969Gd2N1sOK5r6ldhiZ3Z3T+vj5V08Naev
         KUQWJqbHYFr89jzyxuaqZ2IrrpuNLrqJYQpPpRF5zzP2CUlaqVgI3IlPZ5k4E5P6KZHl
         7qUA==
X-Gm-Message-State: AOAM531Hj/Df5GlBB7HDMaIOgiP5hL8LP9ETkCjT97WOHva0ORWKVp1C
	tIw/v9yAQm8Mmtc+WH0XqF24GQ==
X-Google-Smtp-Source: ABdhPJytsqdO5d2kpVqJ9mIDwNDjF08hSxlxJZgO7iZIJNRCJ4lHvtHfAQZ7XFMm+yJ82HUdKUUH5Q==
X-Received: by 2002:a63:61d3:: with SMTP id v202mr4607974pgb.193.1644346058707;
        Tue, 08 Feb 2022 10:47:38 -0800 (PST)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id gk15sm3594453pjb.3.2022.02.08.10.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 10:47:38 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROMEOS EC USB TYPE-C DRIVER),
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v2 1/4] platform/chrome: cros_ec_typec: Move mux flag checks
Date: Tue,  8 Feb 2022 18:47:18 +0000
Message-Id: <20220208184721.1697194-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208184721.1697194-1-pmalani@chromium.org>
References: <20220208184721.1697194-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move mux and role flag checks inside of cros_typec_configure_mux(),
which is a more logical location for them.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes in v2:
- Removed unrelated "ret" variable initialization.

 drivers/platform/chrome/cros_ec_typec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c6f17e3ef72d..58d08dd02f65 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -521,6 +521,13 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	enum typec_orientation orientation;
 	int ret;
 
+	/* No change needs to be made, let's exit early. */
+	if (port->mux_flags == mux_flags && port->role == pd_ctrl->role)
+		return 0;
+
+	port->mux_flags = mux_flags;
+	port->role = pd_ctrl->role;
+
 	if (mux_flags == USB_PD_MUX_NONE) {
 		ret = cros_typec_usb_disconnect_state(port);
 		goto mux_ack;
@@ -983,13 +990,6 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
 		return 0;
 	}
 
-	/* No change needs to be made, let's exit early. */
-	if (typec->ports[port_num]->mux_flags == mux_resp.flags &&
-	    typec->ports[port_num]->role == resp.role)
-		return 0;
-
-	typec->ports[port_num]->mux_flags = mux_resp.flags;
-	typec->ports[port_num]->role = resp.role;
 	ret = cros_typec_configure_mux(typec, port_num, mux_resp.flags, &resp);
 	if (ret)
 		dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
-- 
2.35.0.263.gb82422642f-goog

