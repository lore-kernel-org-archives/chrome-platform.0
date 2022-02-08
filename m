Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7780D2F27
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 18:47:28 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id i17so20408609pfq.13
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 10:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e3mDsgPoCgCrdjC5qFpp5/iSytvlH62dGtUdddIuE3E=;
        b=CghqlIsbj6Rxbr80iMIRS6hVt5LWGI8A122UztcA3EyxvmEzTAZf+cC2u7rAg0LAHk
         8YHiwwLBwgBG9Y58GoUbf7fgYICCy+ds0fSHZSNO4Q2WmUWZpyukUTRY1wbSVP1CuvQ0
         6UDu+NUJX2oH0K5yUWl0QhVR11y9bfGXgIhJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e3mDsgPoCgCrdjC5qFpp5/iSytvlH62dGtUdddIuE3E=;
        b=wkOm/AcoyA8qxYU1ynEstN3Juv6r5KgdjwfuyoiXW3hR0XP1VFfPaG7rVxqBhX2IUp
         Zvap1ILWQzLM738xepGdmVymqT6uiloB7Tt/x+quUR/8rRu7XMZJ9AgmIiOs+kk3Wz9n
         UKKkLK2zuzsCurnEp5tfty831RybG4hVsmOEV/1ez7tvmUIERQ05kNHgfX4rMqIf7ReV
         YeadpIvXVPUp6nQoRgyAxwQeVRemte5413sMj2cGot2CZMVI1jP71pkLxGHf9jHNplT5
         tPK7efJJ6tHzvdIqj+1vzOgxX0CKxkI5Cq30tXTv9/qIpQCjpa7oYorfjmkDLO6xKP8p
         eDEg==
X-Gm-Message-State: AOAM533OqeoYh8ccwrlJNPZkEaRWKHsgSFQJUDxn8Va9sonMYgu4x4fu
	F0sWEXRT65CBXf3qaT2XETLC3Q==
X-Google-Smtp-Source: ABdhPJwmmlG3Hr5gYkqZeLrgLcdQSx95Xr9IgrXutd+5QJRvfxQljD50gKaZjrJ7XAyNISUBOUFOIQ==
X-Received: by 2002:a63:4743:: with SMTP id w3mr286743pgk.207.1644346047783;
        Tue, 08 Feb 2022 10:47:27 -0800 (PST)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id gk15sm3594453pjb.3.2022.02.08.10.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 10:47:27 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROMEOS EC USB TYPE-C DRIVER),
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v2 0/4] platform/chrome: cros_ec_typec: Reorganize mux configuration
Date: Tue,  8 Feb 2022 18:47:16 +0000
Message-Id: <20220208184721.1697194-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a short series that reorganizes when mux configuration occurs
during Type C port updates. The first 2 patches are minor refactors
which move some of the mux update logic to within
cros_typec_configure_mux(). The third patch moves
cros_typec_configure_mux() itself to be earlier in
cros_typec_port_update().

The final patch updates the stashed mux flag when a partner removal has
occured.

v1:
https://lore.kernel.org/chrome-platform/20220207214026.1526151-1-pmalani@chromium.org/

Changes in v2:
- Addressed minor comments (unrelated variable initialization. variable
  name change, return value can be 0).

Prashant Malani (4):
  platform/chrome: cros_ec_typec: Move mux flag checks
  platform/chrome: cros_ec_typec: Get mux state inside configure_mux
  platform/chrome: cros_ec_typec: Configure muxes at start of port
    update
  platform/chrome: cros_ec_typec: Update mux flags during partner
    removal

 drivers/platform/chrome/cros_ec_typec.c | 76 +++++++++++--------------
 1 file changed, 34 insertions(+), 42 deletions(-)

-- 
2.35.0.263.gb82422642f-goog

