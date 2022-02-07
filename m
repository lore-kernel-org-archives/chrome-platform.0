Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD162F25
	for <chrome-platform@lists.linux.dev>; Mon,  7 Feb 2022 21:40:40 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id g8so5432998pfq.9
        for <chrome-platform@lists.linux.dev>; Mon, 07 Feb 2022 13:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TUCNvjYGBjDLOWx0oqjTNqXH/Yx+Zia2/rtd6r5omRs=;
        b=O7m2P73zV+5NeLlFCzV7cYTbgTSOFUB6jKeJh5bYZY4eykQxfb6J0TLyiaKsWAsdlk
         51kBcDc1bKUHh4BVAuzZ6upxW7bHVwRpqqnKJvzIa9+dNjz1bYnWjYTlq34sKe9ArSVk
         tQKETIKuouocyHBnM+j7QR3RZ1IK/EC+LX6YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TUCNvjYGBjDLOWx0oqjTNqXH/Yx+Zia2/rtd6r5omRs=;
        b=6J3cKSnK55/MU3krzDI9tznBKtj+1ANIARMDgfnRo1INzRFhHmOJQFcQWuLRyHnoYu
         3SXEoKmx6bQMyfkgr1RUkQ3PJmqZUWZI71eDopH4wVWsMiB7LsHyBVPN5pon1D3AMmxn
         W5R5AcelfLmIw5se8NkxFzBOp/sBDTkPrg4zlYy8uv59O5ICaq02pSDv1ZY4RhGhYEzr
         d18N5r3KYjm1dMsKmaGqXEwf7vfI1B7TaHHBf4AL1tlHVYWj4oMUSFc2+/OzkwIMJd0v
         yYjUcx3CvWAnCYlNT7R7wf1U3SdMV2pnyBUk1fk4icjVoCBywMI+J3XBhzlcZziGm9+N
         6wFA==
X-Gm-Message-State: AOAM531chOt3HzMBRtuqeBGzuZVZl9j8rQ9X8MKmZGFcJ5ZBJWDH7AaZ
	h3vhGW4LharGykjvIXlH8CRkJ2ZKb0PiSA==
X-Google-Smtp-Source: ABdhPJy2uusfp5RUHaUg38A19JuXK7AQln9SqEclfLmCzpUTINXPSo4Jt2gaG4sSxhwgVB7W2mNt/w==
X-Received: by 2002:a05:6a00:1514:: with SMTP id q20mr1467788pfu.74.1644270039871;
        Mon, 07 Feb 2022 13:40:39 -0800 (PST)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id s9sm9268010pgm.76.2022.02.07.13.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 13:40:39 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROMEOS EC USB TYPE-C DRIVER),
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH 0/4] platform/chrome: cros_ec_typec: Reorganize mux configuration
Date: Mon,  7 Feb 2022 21:40:22 +0000
Message-Id: <20220207214026.1526151-1-pmalani@chromium.org>
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

