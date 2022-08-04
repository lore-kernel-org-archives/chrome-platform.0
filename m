Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5470D362
	for <chrome-platform@lists.linux.dev>; Thu,  4 Aug 2022 14:31:24 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id 17so19569362pfy.0
        for <chrome-platform@lists.linux.dev>; Thu, 04 Aug 2022 07:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=XofKKYn9mg4q2gO9bGVy8AclmRqAoUii/QmsbgRgaS8=;
        b=HD+lXJyFfIstm0aujJ3DDbrX/PjX1DxWXvUKlIutcTgaczaKGQ3e1ezORvHlh4A8Gd
         /2rEXYpJM82RDeCzLexFcEdt0x5WfQ1Eyi4O4rj5LaK5N2CPBR6KRyip66xldDuJ0RyR
         L7J8XREAOyu4FzlNWngWa0gdv0bFrwlRF0upI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=XofKKYn9mg4q2gO9bGVy8AclmRqAoUii/QmsbgRgaS8=;
        b=FrYuh8isWmvuG1ho/27XER7uGFuz9Uc3YIeEmyxMBH/pWHt7VfPzjFjslgjvjL6zic
         ZtI+a+DIAuHlBqzOoMz7Uu/JGibPQ60jvBqXOaj7d176JNsSYLfwDFvkeIu5BCd7zFdU
         W3hTkl+q03x46PvQwqYmeKqy/Yvd9CW6Kq/fCOzSqtULxbMWtuG9A4TQm62Dj5GuC9ZY
         h7oNhSfr/9ptnqN8B2eh55Dq2ZcCM/UcOy5WaL3S8Y9Zyj5HycmNHfi2Prbo1JyFeHxj
         6H8s/p2PNmvDZjO5zXRFAruIc5cphtP0lLQE16q3mpv0GLcY3NvF9zAfjTdHp9ITnwL8
         /mmA==
X-Gm-Message-State: ACgBeo2rXd6DmTMgPFef2d4YTUZvM3SdLTqgXfuwmNWwRnsDrWlUmSxE
	A62iK6lTJNCUEegb1hT/dYbsdGo0YXmXakUq
X-Google-Smtp-Source: AA6agR6+kxmYi4rGXBBduaHFPdI7d8y6iZUYG1KmbYRV4+suVzRcXDM09XZwvIdCLtlMw66nOpQAwA==
X-Received: by 2002:a63:6d1:0:b0:41c:45d:7d49 with SMTP id 200-20020a6306d1000000b0041c045d7d49mr1860456pgg.437.1659623483705;
        Thu, 04 Aug 2022 07:31:23 -0700 (PDT)
Received: from chromium.org ([2620:0:1000:5e10:630b:1bd3:aad8:74fd])
        by smtp.gmail.com with ESMTPSA id w200-20020a627bd1000000b005281d926733sm999612pfc.199.2022.08.04.07.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:31:23 -0700 (PDT)
Date: Thu, 4 Aug 2022 07:31:20 -0700
From: Jack Rosenthal <jrosenth@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Stephen Boyd <swboyd@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6] firmware: google: Implement cbmem in sysfs driver
Message-ID: <YuvYOOvQqg424LoS@chromium.org>
References: <CAODwPW-eQ-dYvfCGZ13tOzh4gPdLU9ZoFg9joWpRTX22OXa4Ow@mail.gmail.com>
 <20220802140343.3468976-1-jrosenth@chromium.org>
 <YuuBrUmiRYoaSmPw@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuuBrUmiRYoaSmPw@google.com>

On 2022-08-04 at 08:22 +0000, Tzung-Bi Shih wrote:
> On Tue, Aug 02, 2022 at 07:03:43AM -0700, Jack Rosenthal wrote:
> > Link: https://issuetracker.google.com/239604743
> 
> I doubt if the Link tag would be useful for public.

Thanks, made the bug public and kept the link.

> > Reported-by: kernel test robot <lkp@intel.com>
> 
> Suggest to drop the Reported-by tag even if the robot reported some compile
> errors during the development.  Given that the patch isn't a fixup but
> supporting something new (which isn't "reported by" the robot).

Done.
