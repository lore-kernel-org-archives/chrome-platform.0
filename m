Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D447B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 14:37:24 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id v19so27368751edd.4
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 07:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oIgzWiqZ9B5DH/Ah6uNm4nobex6Dnfmxiak8xN0J0Rg=;
        b=dWpsiqdRek7kuhblNqCkOUDbqDqFCbD401L+uVtIYl+aV6TVlPNqrWftvFHLbeyON5
         /U5PIaeZPpZd+M8qlIkzZozaULrWD2keeY4M9a31K0N6odL1/my2Qw2YQV8HB8htGDcR
         +jccJDDPU3uc2BCvmGrl8TA11HMeBCOYGZzZKiEgxnzBlXor0O+x6oND7ZjIBYBTsj6h
         lt8BNSfH347kyyDE5Ty6IFg6JqKSevWLqGN2FLDmV0r/kE768ujIgSNxcbs4fdtSqcsQ
         yqjh88Ud3fhocxI54S2Ky5W9BnutWGyl9W9+Xk46rAIi781BoIyGzdJwaob1bhjPzgu8
         PFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oIgzWiqZ9B5DH/Ah6uNm4nobex6Dnfmxiak8xN0J0Rg=;
        b=m22LonyaGxvLCPZPZZkEF4sxKYh0EFVB7KjsDuxVW9eQaikXij3u/9EmvlaF4dnjCG
         P9KkRwzQ1Cv2trWoZnlGCcGPlw5cA8w3anjLjjLFz6pYfQnvhNkDiJgWaNY+u5wV+DFj
         GU2rLS4pTlbAwbX3T3riARExJrik70MFJoV5sfiRNT7GPlTsnD7OGDpssDilPl9gNFwG
         XoPzozfyrp7kwUvdbRd86Ue1Ok1e1T+ExN4t1+wfZ/Z+fzXzxzbW8lUFKVxUsSfaNJo/
         kCBnGHEqdOqStx9pxIIydemdVR6/N++8kRc5vdBbapLmdq+p2z6nyvX6mjY1VmrDigmB
         qBZg==
X-Gm-Message-State: AOAM532Jd8yemKdfhTKe6ZuAWFTRFWu3ebkqlbq3Ru1k0JN1ejn/Z3vI
	ek+8CPT8nKMFYQS70xFBh7HLATmPouPXGI3SlQAvuw==
X-Google-Smtp-Source: ABdhPJyzhAftpT5VLkXR18MJk31HDfd3kIidetYc8tMvuBlBYjURb2buh+BzqLpOLixltJAbgrclTo+rVNXIt604j8k=
X-Received: by 2002:a05:6402:3688:b0:42d:d3ba:4725 with SMTP id
 ej8-20020a056402368800b0042dd3ba4725mr40113923edb.212.1654699042272; Wed, 08
 Jun 2022 07:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607145639.2362750-1-tzungbi@kernel.org> <20220607145639.2362750-9-tzungbi@kernel.org>
 <CABXOdTdx7jKLbHa3X7aOz3wUMpwWWHkncfKuRyGzonkA92Rg=w@mail.gmail.com> <YqAGmpdTfZsa7Lux@google.com>
In-Reply-To: <YqAGmpdTfZsa7Lux@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 07:37:10 -0700
Message-ID: <CABXOdTexvEoaRvOdoTeoHoGpHqHPPHvJAL8sYSBS4fn7eLkCgA@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] platform/chrome: cros_ec_proto: handle empty
 payload in getting proto info
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 7:17 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Tue, Jun 07, 2022 at 11:47:56AM -0700, Guenter Roeck wrote:
> > On Tue, Jun 7, 2022 at 7:57 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > >
> > > cros_ec_get_proto_info() expects to receive
> > > sizeof(struct ec_response_get_protocol_info) from send_command().  The
> > > payload is valid only if the return value is positive.
> > >
> > > Add Kunit tests for returning 0 in send_command() and handle the case in
> > > cros_ec_get_proto_info().
> > >
> > That should be two separate patches.
>
> Ack, will separate them in next version.  I put them together because I wrote
> Kunit test first to make sure the second half takes effect (somehow TDD).
>
> Could I still put the Kunit patch first (even if it introduces Kunit test
> failure)?
>

Sorry, I am running behind with e-mails.

If you want to, but why not let the fix come first ? If the unit test
patch is first, mayle add a note after --- indicating that it is
expected to fail and will be fixed with the next patch.

Thanks,
Guenter

> >
> > > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > > ---
> > > No v1.  New in the series.
> > >
> > >  drivers/platform/chrome/cros_ec_proto.c      |   5 +
> > >  drivers/platform/chrome/cros_ec_proto_test.c | 132 +++++++++++++++++++
> > >  2 files changed, 137 insertions(+)
> > >
> > > diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> > > index 893b76703da6..6f5be9e5ede4 100644
> > > --- a/drivers/platform/chrome/cros_ec_proto.c
> > > +++ b/drivers/platform/chrome/cros_ec_proto.c
> > > @@ -314,6 +314,11 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
> > >                 goto exit;
> > >         }
> > >
> > > +       if (ret == 0) {
> > > +               ret = -EPROTO;
> > > +               goto exit;
> > > +       }
> > > +
> >
> > I think you can move that into the if() statement above (which already
> > checks for ret >=0),
> > making it a special case of that situation.
>
> Nope, there is no "ret >= 0" (you could be confusing with
> cros_ec_get_host_event_wake_mask()).
>
> The result flow roughly like:
>
> ret = send_command(...);
> if (ret < 0)
>   goto exit;
>
> mapped = cros_ec_map_error(...);
> if (mapped) {
>   ...
>   goto exit;
> }
>
> if (ret == 0) {
>   ...
>   goto exit;
> }
