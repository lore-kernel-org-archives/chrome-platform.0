Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF221FCE
	for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 20:07:56 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id m6-20020a05683023a600b0060612720715so2108784ots.10
        for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 13:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WgtNrJrhv5bCTIhJBeU8a6bia5VueZCuqtt19PJobgc=;
        b=m/R7+4+FpGTf4xWdG6rKoNguLNzHDKCbXTDgmtDNIyZ1OTRLFxXKHZx73pWHn6rgsA
         16PsXlcCi2+zblZNp8bqn3Y0ZxkrKF7FVX4eZZBKbW+4blOn1GSPs5nF2XZIibnj9Kpi
         Bvdgr19bkM121NgCX0qn5u52ktfdCIy/Jarss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WgtNrJrhv5bCTIhJBeU8a6bia5VueZCuqtt19PJobgc=;
        b=N2Q+g2c0Ll0MHaokR8UBFo06b8fC95rRqjMGZ+A/o8AZybUf8d8Ncw9KmQ2hfju2yv
         q+KYaIx5zkkcbTE08DC8ooCv8uWbZYI1V2gP+HY5OO8xHmaj8coB/8TGfQfDLXgHcX64
         I5pSnte4Mz5MQlYUtWMHG4C9zx3KL59vHS5Pa2JZfwEk4GpngVQIyOXqCKu+0cyKToy+
         KScBE5+Hf87KEWzb3uTyuJAzW7zsBMqXUjdjq3p6xgX8aIZuB6qci96bAoG3Z1Nl63I4
         GTHEjrHZNvkfkOluc8etEeDVvOuhxMY+nqmp/TQEPS0a9wTejsiJI85QMPXrm+6VBekA
         zPTw==
X-Gm-Message-State: AOAM530HGc4btf+TJr2laNOx+biyUx7VZhTyHHAFvC1nPhCK8AM3+xnI
	zc8uSShYhxsy0y2u71rNPr2gCh67mO+yofLfQQCAAA==
X-Google-Smtp-Source: ABdhPJyJ7ONb1oWdAUazJjnnAp03o8+2u/wSw0YPZbj8oBuS2WRzetKTsNkIKSn0J98vjcan1tYa4qs+574uLdYie8I=
X-Received: by 2002:a05:6830:13ce:b0:606:702b:87f0 with SMTP id
 e14-20020a05683013ce00b00606702b87f0mr561772otq.159.1652904475487; Wed, 18
 May 2022 13:07:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 May 2022 13:07:55 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YoR+w7CSqN0aAE5b@google.com>
References: <20220516183452.942008-1-swboyd@chromium.org> <YoR+w7CSqN0aAE5b@google.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 18 May 2022 13:07:55 -0700
Message-ID: <CAE-0n50KE9bkqZvCOLtCGiq3g1jYhK7zpVcVFBzinaguNhNaPw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Input: cros-ec-keyb: Better matrixless support
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	"Joseph S. Barrera III" <joebar@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Torokhov (2022-05-17 22:06:11)
> Hi Stephen,
>
> On Mon, May 16, 2022 at 11:34:50AM -0700, Stephen Boyd wrote:
> > This is a followup to my previous patch[1] that skips keyboard registration
> > when the matrix properties aren't present. This adds a compatible string
> > for this scenario so we can ease existing DTBs over to the new design.
>
> As discussed offlist I massaged the binding and the driver code a bit
> and applied it to an immutable branch off v5.17:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ib/5.17-cros-ec-keyb
>
> that you can share with DTS maintainer(s) to accelerate DTS conversions.
>
> I also dropped the original patch as it did not make it to Linus' tree
> yet.
>

Ok thanks. Doug noticed some problems with the dt binding. Here's a
follow up patch that you can squash in or apply on top.

---8<---
From: Stephen Boyd <swboyd@chromium.org>
Date: Wed, 18 May 2022 13:03:58 -0700
Subject: [PATCH] dt-bindings: google,cros-ec-keyb: Fixup bad compatible match

This uses anyOf which is wrong. Use oneOf and move the items under the
description. Also drop allOf for $ref.

Reported-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../bindings/input/google,cros-ec-keyb.yaml           | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index e11cbf508723..c31a02149f37 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -20,13 +20,11 @@ description: |

 properties:
   compatible:
-    anyOf:
+    oneOf:
       - description: ChromeOS EC with only buttons/switches
-      - items:
-          - const: google,cros-ec-keyb-switches
+        const: google,cros-ec-keyb-switches
       - description: ChromeOS EC with keyboard and possibly buttons/switches
-      - items:
-          - const: google,cros-ec-keyb
+        const: google,cros-ec-keyb

   google,needs-ghost-filter:
     description:
@@ -58,8 +56,7 @@ if:
       contains:
         const: google,cros-ec-keyb
 then:
-  allOf:
-    - $ref: "/schemas/input/matrix-keymap.yaml#"
+  $ref: "/schemas/input/matrix-keymap.yaml#"
   required:
     - keypad,num-rows
     - keypad,num-columns
-- 
https://chromeos.dev
