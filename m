Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB584A20
	for <chrome-platform@lists.linux.dev>; Thu,  1 Dec 2022 20:10:33 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id x28so1253505qtv.13
        for <chrome-platform@lists.linux.dev>; Thu, 01 Dec 2022 12:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5BHelv3N+41uf2laSJpjxNnqMJlO6nXbKkfIvjH6bF0=;
        b=mNabcctar8gTptAWFv2qhOoG6jR3HGKA09XMyZgezk74MidRGCgacejr1mVfybneYi
         LGwixB3c7ahYtBDjCFXzcFSSb2OCsoJ68ibVHMcIHuAHvGQqkB2viOrdeVlg+RzDP31j
         6rzdkiEzi0902yFRNWpNNhTFw0rneMKbSH+6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BHelv3N+41uf2laSJpjxNnqMJlO6nXbKkfIvjH6bF0=;
        b=tuctRr8CKa1PItCva2DODn8JAMZCNjwgLiXtqIz6ObaauqLbdcHT+7CsMZs79OyOYN
         pDDc2Rvgvro9X1Tak6UCrTUpzA5z4zjj7U6gXo3dLtx7GSbFxwdZfZQP6Eyv2kLrDgJ6
         mqb1GPsCM7GGLnMPSaTLDDafAnrTRD93RHejtu/OP22Fh9s5pEs6TMxrPU/jN8x/Q6SV
         IfIlhk0JCL9/osbngGvftGQFAg/rNxZnkPGWTC2SbcfiIqneCrVZX4ZRbTqPFlGL0NnV
         PsSQWfU7FOaNVx0bVopQ+X0da0AJwa7zjmv0aQE++WhuUGnnaqTpmqn6+8TE1UPvR0Iz
         f+xg==
X-Gm-Message-State: ANoB5pku2psngW3yInOHafpfbb7+l4FI6xN8Ny1O9BI2Nvg+Ec2X/9ib
	lZ/OWQZ/iJgDdnc7SyXPHfqWJ/YaBBgPSK2+tE9R/aLti7WdxQ==
X-Google-Smtp-Source: AA0mqf7zV4NhddToUDXZdGlH1vmjh2U7UTZDhpiLUQ9F8GZDw1aEDBFG0Fic3rL4G2eYwPMHv3MFh3XeZAMF/U6WpQo=
X-Received: by 2002:ac8:4a13:0:b0:3a5:b4ab:cb80 with SMTP id
 x19-20020ac84a13000000b003a5b4abcb80mr37195576qtq.59.1669925432860; Thu, 01
 Dec 2022 12:10:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221130231936.1666390-1-wonchung@google.com>
In-Reply-To: <20221130231936.1666390-1-wonchung@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 1 Dec 2022 12:10:22 -0800
Message-ID: <CACeCKad16bs_f6bLthTAoEL28tPvf1S10WDeM7ugeaS9g7R25w@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Create new USB driver for RGB keyboard
 in ChromeOS devices
To: Won Chung <wonchung@google.com>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Won,

On Wed, Nov 30, 2022 at 3:19 PM Won Chung <wonchung@google.com> wrote:
>
> Without any driver bound to RGB keyboard, it may not be suspended
> properly, preventing USB xHCI to be suspended and causing power drain.
> Create new USB driver for RGB keyboard so that it can be suspended
> properly.

This seems like overkill. Can't you set this from USB's sysfs nodes
like power/control [1] ?

[1] https://www.kernel.org/doc/html/latest/driver-api/usb/power-management.html#the-user-interface-for-dynamic-pm


Best regards,

-Prashant
