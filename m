Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12CF1FAA
	for <chrome-platform@lists.linux.dev>; Fri, 29 Apr 2022 23:31:14 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d15so8410341plh.2
        for <chrome-platform@lists.linux.dev>; Fri, 29 Apr 2022 16:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9YgscAPmkdXZdvGItBkARoN39El7k5vd+0X9bZIsm5A=;
        b=KmAugV8D8y1df2eVDeWevN4/iD84DGOM8cNKf2bLCx5dR+9pytBdoDJY8NaKCN/bpm
         4YWdnvT77Gjnx+W7GzD5V38U1PiwXjZMClOjfR+QN6nFNmmw0nN1h5qC9iPb6pfgNdDK
         faZR9HqrO1iNLv7lbv7EuNZ8eFUp6DgrLLgzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9YgscAPmkdXZdvGItBkARoN39El7k5vd+0X9bZIsm5A=;
        b=5YavhAkiOwawnGjepXHy7fP+wogq4TkSlrY0bnK6RjDoKaCeA60M3sxc5loT4Juirb
         UzcRnCXjBJk1BKCsBzZSkwy1AF26VpPYzCtYPqFksrvQl7r0qM5U2a8ve/DLAhk0Vo0T
         bwvGT8jkFWW4NKBqCGmRRh9XJD7a1WaWtkPWqgEuKM/3o9iSS8PbU6hU7vSNo8msEfpb
         qquZdOHbwY9pgvH4q9RQUtiIjwrhNSiZrprXdV7/Cu8My6GMP7Nf6h1Am6aPaQdWT4zv
         oRztnwXZezzKxxk9F3ZxfYKN4lbP1Fj6kSx9uaaYr75x3adh2leFRsFbmUQYrcQn0Zib
         qp/g==
X-Gm-Message-State: AOAM530ks4cn1SPQJGPKD5w4dSRNXD86ZreN1MrJ6CIYoZvhOG2Ivoct
	8EbEl/6EQTRM/X5JhvNxNA8bMA==
X-Google-Smtp-Source: ABdhPJxY44iFfukhQ8UWK7Y9QYQdpA1U3pRUTpzNyjs/fGYqLlp0a0KtfPcanGdAuptsnq82S1XbrQ==
X-Received: by 2002:a17:90a:c302:b0:1bd:14ff:15 with SMTP id g2-20020a17090ac30200b001bd14ff0015mr6436842pjt.19.1651275074332;
        Fri, 29 Apr 2022 16:31:14 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:5172:14b3:3687:1fb0])
        by smtp.gmail.com with ESMTPSA id i24-20020aa78b58000000b0050dc762818esm223037pfd.104.2022.04.29.16.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 16:31:13 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	"Joseph S. Barrera III" <joebar@chromium.org>
Subject: [PATCH v2 0/2] Input: cros-ec-keyb: Better matrixless support
Date: Fri, 29 Apr 2022 16:31:10 -0700
Message-Id: <20220429233112.2851665-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a followup to my previous patch[1] that skips keyboard registration
when the matrix properties aren't present. This adds a compatible string
for this scenario so we can ease existing DTBs over to the new design.

Changes from v1 (https://lore.kernel.org/r/20220427203026.828183-1-swboyd@chromium.org):
 * Better enforcement of properties in DT binding
 * Skip registration by means of adding compatible to device id list

Stephen Boyd (2):
  dt-bindings: google,cros-ec-keyb: Introduce switches only compatible
  Input: cros-ec-keyb - skip keyboard registration for switches
    compatible

 .../bindings/input/google,cros-ec-keyb.yaml   | 95 +++++++++++++++++--
 drivers/input/keyboard/cros_ec_keyb.c         | 15 ++-
 2 files changed, 102 insertions(+), 8 deletions(-)

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Joseph S. Barrera III" <joebar@chromium.org>

[1] https://lore.kernel.org/all/20220425210726.3813477-1-swboyd@chromium.org/

base-commit: 4352e23a7ff2f8a4ff229dd1283ed2f2b708ec51
-- 
https://chromeos.dev

