Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421B627EC5
	for <chrome-platform@lists.linux.dev>; Thu, 28 Sep 2023 07:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB195C433C7;
	Thu, 28 Sep 2023 07:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695884848;
	bh=BqIVWLtIVub2J3k2EyHHh72WborluzCvRpmy/bm3U/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DGIUY8PorTFVb8t5dil1RDqD8Wxp8f0SHs41lyVkqkO/kOOvp7QfeOcCcuGnkXtvb
	 RM7GTeHYrP/fTZzp3RtokHZb+SV5JGXSRwnlTIytMSLDXxwzXlrlvCgS3+k7Um6fxR
	 0jRLm/4x6wx0Ag92YDKu8eC+BKQd9rrrvvrdDFKaje7PbglN6+3+SvlzMvgk7v0KMv
	 oZIcuK9PNpUjqErMfsta8c59i8Sm93Jc09QHlnjTj6BVcJqsg3/evkfebdQbE5FfIv
	 e4f66WRs48DoxZ4z38i82iWomSNcn7Z4x8r0bngWRGBOYIYBPuY10+fryR4yhHgOIy
	 BpqVKQR3kQYQw==
Date: Thu, 28 Sep 2023 15:07:25 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rob Barnes <robbarnes@google.com>
Cc: chrome-platform@lists.linux.dev, gwendal@chromium.org,
	groeck@chromium.org
Subject: Re: [PATCH] drivers/cros_ec: Reduce log polling period to 2s
Message-ID: <ZRUmLWf6COwE8gtv@google.com>
References: <20230921141935.3973069-1-robbarnes@google.com>
 <ZQ6k1K//086Ptqg0@google.com>
 <CA+Dqm30KGiSVnJ+z=ToT_i3xS6dN5+opCHbp-9tfd+ZqxdgJQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Dqm30KGiSVnJ+z=ToT_i3xS6dN5+opCHbp-9tfd+ZqxdgJQA@mail.gmail.com>

On Tue, Sep 26, 2023 at 12:57:22PM -0600, Rob Barnes wrote:
> On Sat, Sep 23, 2023 at 2:42 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Thu, Sep 21, 2023 at 02:19:35PM +0000, Rob Barnes wrote:
> > > 2. Yields more recent logs prior to a crash, facilitating easier debugging.
> >
> > The approach depends on multiple parties before a system reboot: EC reports
> > on panic, AP sends EC commands for reading the logs, userland programs
> > (e.g. timberslide) write the logs to filesystem, and filesystem
> > synchronization.  If anyone in the path didn't work in time, the logs
> > disappear.
> 
> This change is just affecting the continuous polling period of the
> cros_ec driver.
> Syncing the log immediately after a panic is a separate path and will only work
> when EC supports system safe mode recovery, most don't.

I guess I misunderstood.  Is the understanding "EC can't respond to further
host commands from AP after EC crashed unless some more special supports
(e.g. system safe mode)" correct?

If yes, how about after EC reported a panic but before EC crashed?  Can EC
respond to host commands during the period?

> The hope with shortening the period is that cros_ec.previous will contain more
> relevant logs after a crash, even when safe mode isn't enabled.

What is current approach for getting EC crash dumps/logs from AP?  If the
system didn't save them before system reset, are they available after next
boot?
