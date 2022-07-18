Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573DBA20
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 03:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12827C341C0;
	Mon, 18 Jul 2022 03:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658116223;
	bh=W1l3MKFfc668mGrdCGEIa+NpnVFSilikyS52LQqnzqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZwzSCq08R4rpdqTK3LFcHQ2o/1tgJhyW6XJUnoxyRnGY3ylxtyuz5jRq/TukLcBw
	 qv8CB0V/I8szCaSW7Brc/mNeupOS+zsbcdiFzjLThC5qMZV9MgXxQXX0vMQKOkNYx2
	 KbVDIxoiVHV63T7t9S4hJ9FjU7rASKgy50nS04bQYbIZCuSg/vPkJtIWvhJK0FhRCd
	 pcn4XROh8HvcpA3XD876//T7kw/JwTFzyO3tRCE8S38qP8hA9ZRYTQfN+Ngk3tpeN/
	 hpgbN+3udW6eZ8qIjI+1VS/OCz+aMqGAJyk7SPseicpVWyXMeRpUYfHMXW+XyjRNW4
	 0i6XXnxGpMvKQ==
Date: Mon, 18 Jul 2022 03:50:19 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <groeck@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH 05/11] platform/chrome: cros_ec_proto: separate
 cros_ec_wait_until_complete()
Message-ID: <YtTYexaeIWZgSwfH@google.com>
References: <20220628024913.1755292-1-tzungbi@kernel.org>
 <20220628024913.1755292-6-tzungbi@kernel.org>
 <CABXOdTeC+q-UiPiThqL5MGg-+cGACGW4qLaLKZbmX4M26TvbDg@mail.gmail.com>
 <Ys+OlrVCy4MkyRnr@google.com>
 <CABXOdTfJ6x5ePkmj+w21jTX7EOTXZrCd8PwikAJQTfeQmUBxaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXOdTfJ6x5ePkmj+w21jTX7EOTXZrCd8PwikAJQTfeQmUBxaQ@mail.gmail.com>

On Thu, Jul 14, 2022 at 07:29:45AM -0700, Guenter Roeck wrote:
> On Wed, Jul 13, 2022 at 8:33 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > On Wed, Jul 13, 2022 at 11:15:47AM -0700, Guenter Roeck wrote:
> > > On Mon, Jun 27, 2022 at 7:49 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > > > +               ret = cros_ec_xfer_command(ec_dev, msg);
> > > > +               if (ret == -EAGAIN)
> > > > +                       continue;
> > > > +               if (ret < 0)
> > > > +                       break;
> > >
> > > With the command allocated on the stack, this can return immediately.
> >
> > Nack, the function has no goto labels.  `return ret` follows the loop
> > immediately.  The `break` here doesn't make it to become too complicated.
> > I would prefer to keep it.
> 
> Sorry, you lost me here. The code after the loop does
> 
>            kfree(msg);
>            return ret;
> 
> If kfree() is no longer necessary, only the return statement is left. So break;
> is identical to return ret;. Am I missing something ?

You are correct.

I meant personally I would prefer to use `break`:
  * The loop is short so that it won't become too complicated.
  * Keep the function has a single exit point.

But, anyway, let's use `return ret` to make it explicit.
