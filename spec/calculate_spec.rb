RSpec.describe 'calculate' do
  context 'when configuration is 30  1 /bin/run_me_daily' do
    context 'when current time is 16:10' do
      let(:current_time) { '16:10' }

      it 'returns 1:30 tomorrow /bin/run_me_daily' do
        expect(calculate(minutes: '30', hour: '1', command: '/bin/run_me_daily', current_time: current_time)).to eq({
          hour: '1', minutes: '30', day: 'tomorrow', command: '/bin/run_me_daily'
        })
      end
    end
  end

  context 'when configuration is 45  * /bin/run_me_hourly' do
    context 'when current time is 16:10' do
      let(:current_time) { '16:10' }

      it 'returns 16:45 today - /bin/run_me_hourly' do
        expect(calculate(minutes: '45', hour: '*', command: '/bin/run_me_hourly', current_time: current_time)).to eq({
          hour: '16', minutes: '45', day: 'today', command: '/bin/run_me_hourly'
        })
      end
    end
  end

  context 'when configuration is *  * /bin/run_me_every_minute' do
    context 'when current time is 16:10' do
      let(:current_time) { '16:10' }

      it 'returns 16:10 today - /bin/run_me_every_minute' do
        expect(calculate(minutes: '*', hour: '*', command: '/bin/run_me_every_minute', current_time: current_time)).to eq({
          hour: '16', minutes: '10', day: 'today', command: '/bin/run_me_every_minute'
        })
      end
    end
  end

  context 'when configuration is * 19 /bin/run_me_sixty_times' do
    context 'when current time is 16:10' do
      let(:current_time) { '16:10' }

      it 'returns 19:00 today - /bin/run_me_sixty_times' do
        expect(calculate(minutes: '*', hour: '19', command: '/bin/run_me_sixty_times', current_time: current_time)).to eq({
          hour: '19', minutes: '0', day: 'today', command: '/bin/run_me_sixty_times'
        })
      end
    end
  end
end
